require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get appliance" do
    get static_pages_appliance_url
    assert_response :success
  end

  test "should get bill" do
    get static_pages_bill_url
    assert_response :success
  end

  test "should get setting" do
    get static_pages_setting_url
    assert_response :success
  end
end
