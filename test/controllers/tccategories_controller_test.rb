require 'test_helper'

class TccategoriesControllerTest < ActionController::TestCase
  setup do
    @tccategory = tccategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tccategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tccategory" do
    assert_difference('Tccategory.count') do
      post :create, tccategory: { bunrui_id: @tccategory.bunrui_id, ctg: @tccategory.ctg }
    end

    assert_redirected_to tccategory_path(assigns(:tccategory))
  end

  test "should show tccategory" do
    get :show, id: @tccategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tccategory
    assert_response :success
  end

  test "should update tccategory" do
    patch :update, id: @tccategory, tccategory: { bunrui_id: @tccategory.bunrui_id, ctg: @tccategory.ctg }
    assert_redirected_to tccategory_path(assigns(:tccategory))
  end

  test "should destroy tccategory" do
    assert_difference('Tccategory.count', -1) do
      delete :destroy, id: @tccategory
    end

    assert_redirected_to tccategories_path
  end
end
