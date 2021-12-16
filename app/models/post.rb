# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :house
  validates :body, length: { minimum: 1, maximum: 280 }
end
