require "test_helper"

class CreateBillTest < ActionDispatch::IntegrationTest
  test 'invalid bill create' do
    get new_bill_path
    assert_no_difference 'Bill.count' do
      post bills_path, params: { bill: { name: '',
                                         amount: 0.001} }
    end
  end

end
