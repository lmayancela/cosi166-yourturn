# frozen_string_literal: true

class Bill < ApplicationRecord
  has_many :bill_record
  has_many :users, through: :bill_record
  has_rich_text :description
  has_one_attached :thumbnail

  validates :amount, numericality: {greater_than: 0.01}
end
