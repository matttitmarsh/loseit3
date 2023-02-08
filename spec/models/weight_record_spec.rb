require 'rails_helper'

RSpec.describe WeightRecord, type: :model do
  describe "validations" do
    it { should validate_presence_of(:effective_date) }
    it { should validate_presence_of(:weight) }
    it { should validate_numericality_of(:weight) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:competition) }
  end
end
