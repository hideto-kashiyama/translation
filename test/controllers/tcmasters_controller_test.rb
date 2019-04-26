require 'test_helper'

class TcmastersControllerTest < ActionController::TestCase
  setup do
    @tcmaster = tcmasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tcmasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tcmaster" do
    assert_difference('Tcmaster.count') do
      post :create, tcmaster: { bunrui_id: @tcmaster.bunrui_id, e: @tcmaster.e, j: @tcmaster.j, kubun: @tcmaster.kubun, memo: @tcmaster.memo, s_category_id: @tcmaster.s_category_id, tccategory_id: @tcmaster.tccategory_id }
    end

    assert_redirected_to tcmaster_path(assigns(:tcmaster))
  end

  test "should show tcmaster" do
    get :show, id: @tcmaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tcmaster
    assert_response :success
  end

  test "should update tcmaster" do
    patch :update, id: @tcmaster, tcmaster: { bunrui_id: @tcmaster.bunrui_id, e: @tcmaster.e, j: @tcmaster.j, kubun: @tcmaster.kubun, memo: @tcmaster.memo, s_category_id: @tcmaster.s_category_id, tccategory_id: @tcmaster.tccategory_id }
    assert_redirected_to tcmaster_path(assigns(:tcmaster))
  end

  test "should destroy tcmaster" do
    assert_difference('Tcmaster.count', -1) do
      delete :destroy, id: @tcmaster
    end

    assert_redirected_to tcmasters_path
  end
end
