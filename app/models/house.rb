class House < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :appliances
end
