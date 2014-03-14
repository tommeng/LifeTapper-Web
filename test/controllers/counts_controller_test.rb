require 'test_helper'

class CountsControllerTest < ActionController::TestCase
  setup do
    @count = counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create count" do
    assert_difference('Count.count') do
      post :create, count: { activity_id: @count.activity_id, date: @count.date }
    end

    assert_redirected_to count_path(assigns(:count))
  end

  test "should show count" do
    get :show, id: @count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @count
    assert_response :success
  end

  test "should update count" do
    patch :update, id: @count, count: { activity_id: @count.activity_id, date: @count.date }
    assert_redirected_to count_path(assigns(:count))
  end

  test "should destroy count" do
    assert_difference('Count.count', -1) do
      delete :destroy, id: @count
    end

    assert_redirected_to counts_path
  end
end
