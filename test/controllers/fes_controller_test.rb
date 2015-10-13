require 'test_helper'

class FesControllerTest < ActionController::TestCase
  setup do
    @fe = fes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fe" do
    assert_difference('Fe.count') do
      post :create, fe: { adminCommunityName: @fe.adminCommunityName, adminCommunityURL: @fe.adminCommunityURL, adminName: @fe.adminName, adminTwitterID: @fe.adminTwitterID, createDate: @fe.createDate, description: @fe.description, fesName: @fe.fesName, limitNumberOfTeam: @fe.limitNumberOfTeam, registrationDeadline: @fe.registrationDeadline, rule: @fe.rule, startDate: @fe.startDate }
    end

    assert_redirected_to fe_path(assigns(:fe))
  end

  test "should show fe" do
    get :show, id: @fe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fe
    assert_response :success
  end

  test "should update fe" do
    patch :update, id: @fe, fe: { adminCommunityName: @fe.adminCommunityName, adminCommunityURL: @fe.adminCommunityURL, adminName: @fe.adminName, adminTwitterID: @fe.adminTwitterID, createDate: @fe.createDate, description: @fe.description, fesName: @fe.fesName, limitNumberOfTeam: @fe.limitNumberOfTeam, registrationDeadline: @fe.registrationDeadline, rule: @fe.rule, startDate: @fe.startDate }
    assert_redirected_to fe_path(assigns(:fe))
  end

  test "should destroy fe" do
    assert_difference('Fe.count', -1) do
      delete :destroy, id: @fe
    end

    assert_redirected_to fes_path
  end
end
