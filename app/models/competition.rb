class Competition < ApplicationRecord
  has_many :competitors
  has_many :weight_records, dependent: :destroy
  has_many :users, through: :weight_records
end
