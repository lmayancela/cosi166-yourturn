class Task < ApplicationRecord
    belongs_to :house
    has_many :task_record
    has_many :users, through: :task_record
end
