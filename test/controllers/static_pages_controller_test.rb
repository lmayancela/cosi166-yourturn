# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response :success
  end

  test 'should get appliance' do
    get appliances_path
    assert_response :success
  end

  # test "should get bill" do
  #   get billing_path
  #   assert_response :success
  # end
end
