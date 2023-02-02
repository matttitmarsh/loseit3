class WeightRecord < ApplicationRecord
  belongs_to :user
  belongs_to :competition

  validates :weight, presence: true, numericality: true
  validates :effective_date, presence: true
end
