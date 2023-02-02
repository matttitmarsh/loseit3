require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  let!(:user) { create :user }
  it "displays a sign in link" do
    visit "/"
    expect(page).to have_content "LoseIt"
    within("nav") do
      expect(page).to have_content "Login"
      expect(page).to have_content "Signup"
    end

    click_link "Login"
    expect(page).to have_css "h2", text: "Log in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    within("nav") do
      expect(page).not_to have_content "Login"
      expect(page).not_to have_content "Signup"
    end
  end
end
