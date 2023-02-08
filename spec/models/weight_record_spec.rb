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

  describe 'editing' do
    before do
      user = FactoryBot.create(:user)
      second_user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      competition = FactoryBot.create(:competition)
      weight_record = WeightRecord.create!(
        user_id: user.id,
        competition_id: competition.id,
        weight: 0.100e3,
        effective_date: Time.zone.now,
        created_at: Time.zone.now,
        updated_at: Time.zone.now
      )

      edit_path = "/competitions/#{competition.id}/weight_records/#{weight_record.id}/edit"
      competition_id = competition.id
      visit edit_path
    end

    it 'allows a user to edit a post they created' do
      fill_in 'weight_record[weight]', with: 101.00

      click_on "Edit Weight Record"

      expect(page).to have_content(101.00)
    end

    it 'does not allow a user to edit a post they did not create' do
      logout(:user)
      login_as(@second_user, :scope => :user)
      visit @edit_path
      expect(current_path).to eq("/login")
    end
  end
end
