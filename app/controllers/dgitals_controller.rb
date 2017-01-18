require 'digest/sha1'

class DgitalsController < ApplicationController
  before_action :set_dgital, only: [:show, :edit, :update, :destroy]

  # GET /dgitals
  # GET /dgitals.json
  def index
    @source_names = Dgital.select("from_site").group("from_site").all()
    filter = params[:filter] ? params[:filter] : '%'
    search_str = params[:search_str]? '%'+params[:search_str]+'%' : '%'

    if params[:search_str]
      action = UserAction.create(content: params[:search_str])
      action.type = 'search'
      action.save
    end

    if params[:filter] || params[:search_str]
      @dgitals = Dgital.where("from_site LIKE ? AND title LIKE ? ", filter, search_str).page(params[:page]).per(24).order('publish_time DESC')
    else
      @dgitals = Dgital.where.not(image: nil).page(params[:page]).per(24).order('publish_time DESC')
    end

    @search_actions = UserAction.where('type=?', 'search').group('content').order('count_all desc').limit(8).count
    p @search_actions
  end

  # GET /dgitals/1
  # GET /dgitals/1.json
  # def show
  # end

  # GET /dgitals/new
  def new
    @dgital = Dgital.new
  end

  # GET /dgitals/1/edit
  # def edit
  # end

  # POST /dgitals
  # POST /dgitals.json
  def create
    @dgital = Dgital.new(dgital_params)

    respond_to do |format|
      if @dgital.save
        format.html { redirect_to @dgital, notice: 'Dgital was successfully created.' }
        format.json { render :show, status: :created, location: @dgital }
      else
        format.html { render :new }
        format.json { render json: @dgital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dgitals/1
  # PATCH/PUT /dgitals/1.json
  def update
    respond_to do |format|
      if @dgital.update(dgital_params)
        format.html { redirect_to @dgital, notice: 'Dgital was successfully updated.' }
        format.json { render :show, status: :ok, location: @dgital }
      else
        format.html { render :edit }
        format.json { render json: @dgital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dgitals/1
  # DELETE /dgitals/1.json
  # def destroy
  #   @dgital.destroy
  #   respond_to do |format|
  #     format.html { redirect_to dgitals_url, notice: 'Dgital was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def get
    @dgital = Dgital.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @dgital.link }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dgital
      @dgital = Dgital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dgital_params
      params.require(:dgital).permit(:title, :intro, :link, :location, :quality,
        :brand, :contact, :price, :hand_on_date, :publish_time, :image,
        :remote_image_url, :from_site)
    end
end
