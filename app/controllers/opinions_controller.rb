require 'digest/sha1'

class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :create, :edit]

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.page(params[:page]).per(25)
    @opinion = Opinion.new
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/1/edit
  # def edit
  # end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to index, notice: '留言成功' }
        # format.json { render :show, status: :created, location: @opinion }
      else
        @opinions = Opinion.page(1).per(25)
        format.html { render :index }
        # format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  # def update
  #   respond_to do |format|
  #     if @opinion.update(opinion_params)
  #       format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @opinion }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @opinion.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  # def destroy
  #   @opinion.destroy
  #   respond_to do |format|
  #     format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:content, :name, :contact, :parent_opinion_id)
    end
end
