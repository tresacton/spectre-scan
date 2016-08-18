require 'test_helper'

class SpecScansControllerTest < ActionController::TestCase
  setup do
    @spec_scan = spec_scans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spec_scans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spec_scan" do
    assert_difference('SpecScan.count') do
      post :create, spec_scan: { job_id: @spec_scan.job_id, status: @spec_scan.status }
    end

    assert_redirected_to spec_scan_path(assigns(:spec_scan))
  end

  test "should show spec_scan" do
    get :show, id: @spec_scan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spec_scan
    assert_response :success
  end

  test "should update spec_scan" do
    patch :update, id: @spec_scan, spec_scan: { job_id: @spec_scan.job_id, status: @spec_scan.status }
    assert_redirected_to spec_scan_path(assigns(:spec_scan))
  end

  test "should destroy spec_scan" do
    assert_difference('SpecScan.count', -1) do
      delete :destroy, id: @spec_scan
    end

    assert_redirected_to spec_scans_path
  end
end
