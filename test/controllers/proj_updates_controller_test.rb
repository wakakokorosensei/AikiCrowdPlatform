require 'test_helper'

class ProjUpdatesControllerTest < ActionController::TestCase
  setup do
    @proj_update = proj_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proj_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proj_update" do
    assert_difference('ProjUpdate.count') do
      post :create, proj_update: {  }
    end

    assert_redirected_to proj_update_path(assigns(:proj_update))
  end

  test "should show proj_update" do
    get :show, id: @proj_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proj_update
    assert_response :success
  end

  test "should update proj_update" do
    patch :update, id: @proj_update, proj_update: {  }
    assert_redirected_to proj_update_path(assigns(:proj_update))
  end

  test "should destroy proj_update" do
    assert_difference('ProjUpdate.count', -1) do
      delete :destroy, id: @proj_update
    end

    assert_redirected_to proj_updates_path
  end
end
