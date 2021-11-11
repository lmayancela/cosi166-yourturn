# frozen_string_literal: true

class BillRecord < ApplicationRecord
  belongs_to :bill
  belongs_to :user
end
