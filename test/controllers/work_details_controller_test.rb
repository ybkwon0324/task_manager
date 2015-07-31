require 'test_helper'

class WorkDetailsControllerTest < ActionController::TestCase
  setup do
    @work_detail = work_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_detail" do
    assert_difference('WorkDetail.count') do
      post :create, work_detail: { completion: @work_detail.completion, content_detail: @work_detail.content_detail, user_id: @work_detail.user_id, work_id: @work_detail.work_id }
    end

    assert_redirected_to work_detail_path(assigns(:work_detail))
  end

  test "should show work_detail" do
    get :show, id: @work_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_detail
    assert_response :success
  end

  test "should update work_detail" do
    patch :update, id: @work_detail, work_detail: { completion: @work_detail.completion, content_detail: @work_detail.content_detail, user_id: @work_detail.user_id, work_id: @work_detail.work_id }
    assert_redirected_to work_detail_path(assigns(:work_detail))
  end

  test "should destroy work_detail" do
    assert_difference('WorkDetail.count', -1) do
      delete :destroy, id: @work_detail
    end

    assert_redirected_to work_details_path
  end
end
