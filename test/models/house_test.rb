# frozen_string_literal: true

require 'test_helper'

class HouseTest < ActiveSupport::TestCase

  def setup
    @house = houses(:one)
  end

  test 'has two users' do
    assert_equal(@house.users.length(),2)
  end
end
