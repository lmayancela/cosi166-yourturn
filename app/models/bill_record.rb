class BillRecord < ApplicationRecord
  belongs_to :bill
  belongs_to :user
end
