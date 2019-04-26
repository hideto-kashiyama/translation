require 'test_helper'

class BunruisControllerTest < ActionController::TestCase
  setup do
    @bunrui = bunruis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bunruis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bunrui" do
    assert_difference('Bunrui.count') do
      post :create, bunrui: { bunrui: @bunrui.bunrui }
    end

    assert_redirected_to bunrui_path(assigns(:bunrui))
  end

  test "should show bunrui" do
    get :show, id: @bunrui
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bunrui
    assert_response :success
  end

  test "should update bunrui" do
    patch :update, id: @bunrui, bunrui: { bunrui: @bunrui.bunrui }
    assert_redirected_to bunrui_path(assigns(:bunrui))
  end

  test "should destroy bunrui" do
    assert_difference('Bunrui.count', -1) do
      delete :destroy, id: @bunrui
    end

    assert_redirected_to bunruis_path
  end
end
