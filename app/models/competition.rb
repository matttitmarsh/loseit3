class Competition < ApplicationRecord
  has_many :competitors
  has_many :users, through: :competitions
  has_many :weight_records
end
