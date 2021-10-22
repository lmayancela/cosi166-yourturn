class User < ApplicationRecord
  belongs_to :house
  has_many :task_record
  has_many :tasks, through: :task_record
  has_many :bill_record
  has_many :bills, through: :bill_record
end
