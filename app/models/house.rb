# frozen_string_literal: true

class House < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :appliances
  has_many :posts
end
