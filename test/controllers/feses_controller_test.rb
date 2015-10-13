require 'test_helper'

class FesesControllerTest < ActionController::TestCase
  setup do
    @fes = feses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fes" do
    assert_difference('Fes.count') do
      post :create, fes: { adminCommunityName: @fes.adminCommunityName, adminCommunityURL: @fes.adminCommunityURL, adminName: @fes.adminName, adminTwitterID: @fes.adminTwitterID, description: @fes.description, fesName: @fes.fesName, limitNumberOfTeam: @fes.limitNumberOfTeam, registrationDeadline: @fes.registrationDeadline, rule: @fes.rule, startDate: @fes.startDate }
    end

    assert_redirected_to fes_path(assigns(:fes))
  end

  test "should show fes" do
    get :show, id: @fes
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fes
    assert_response :success
  end

  test "should update fes" do
    patch :update, id: @fes, fes: { adminCommunityName: @fes.adminCommunityName, adminCommunityURL: @fes.adminCommunityURL, adminName: @fes.adminName, adminTwitterID: @fes.adminTwitterID, description: @fes.description, fesName: @fes.fesName, limitNumberOfTeam: @fes.limitNumberOfTeam, registrationDeadline: @fes.registrationDeadline, rule: @fes.rule, startDate: @fes.startDate }
    assert_redirected_to fes_path(assigns(:fes))
  end

  test "should destroy fes" do
    assert_difference('Fes.count', -1) do
      delete :destroy, id: @fes
    end

    assert_redirected_to feses_path
  end
end
