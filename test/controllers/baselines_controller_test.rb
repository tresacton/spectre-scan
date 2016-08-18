require 'test_helper'

class BaselinesControllerTest < ActionController::TestCase
  setup do
    @baseline = baselines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baselines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baseline" do
    assert_difference('Baseline.count') do
      post :create, baseline: { job_id: @baseline.job_id, status: @baseline.status }
    end

    assert_redirected_to baseline_path(assigns(:baseline))
  end

  test "should show baseline" do
    get :show, id: @baseline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baseline
    assert_response :success
  end

  test "should update baseline" do
    patch :update, id: @baseline, baseline: { job_id: @baseline.job_id, status: @baseline.status }
    assert_redirected_to baseline_path(assigns(:baseline))
  end

  test "should destroy baseline" do
    assert_difference('Baseline.count', -1) do
      delete :destroy, id: @baseline
    end

    assert_redirected_to baselines_path
  end
end
