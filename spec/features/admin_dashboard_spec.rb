require 'rails_helper'

describe 'admin dashboard' do

  it 'can be reached successfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'cannot be reached by a non admin users' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  # it 'can be reached by admin users' do
  #   user = FactoryBot.create(:admin_user)
  #   login_as(user, :scope => :user)

  #   visit admin_root_path

  #   expect(current_path).to eq(admin_root_path)
  # end
end
