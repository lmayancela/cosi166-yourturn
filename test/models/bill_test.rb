# frozen_string_literal: true

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  def setup
    @bill = bills(:one)
  end
  
  test 'amount can not be smaller than 0.01' do
    @bill.amount = 0.0
    assert_not @bill.valid?
  end

  test 'bill needs to be assocaited to users' do
    assert_equal(@bill.users.length(),1)
  end

end
