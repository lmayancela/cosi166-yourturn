# frozen_string_literal: true

class TaskRecord < ApplicationRecord
  belongs_to :task
  belongs_to :user
end
