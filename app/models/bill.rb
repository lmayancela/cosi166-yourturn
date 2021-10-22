class Bill < ApplicationRecord
    has_many :bill_record
    has_many :users, through: :bill_record
end
