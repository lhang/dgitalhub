require 'test_helper'

class DgitalsControllerTest < ActionController::TestCase
  setup do
    @dgital = dgitals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dgitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dgital" do
    assert_difference('Dgital.count') do
      post :create, dgital: { intro: @dgital.intro, link: @dgital.link, title: @dgital.title }
    end

    assert_redirected_to dgital_path(assigns(:dgital))
  end

  test "should show dgital" do
    get :show, id: @dgital
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dgital
    assert_response :success
  end

  test "should update dgital" do
    patch :update, id: @dgital, dgital: { intro: @dgital.intro, link: @dgital.link, title: @dgital.title }
    assert_redirected_to dgital_path(assigns(:dgital))
  end

  test "should destroy dgital" do
    assert_difference('Dgital.count', -1) do
      delete :destroy, id: @dgital
    end

    assert_redirected_to dgitals_path
  end
end
