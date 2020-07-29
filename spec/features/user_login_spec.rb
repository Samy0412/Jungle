require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
 # SETUP
 before :each do
  @user = User.create!(firstname:"Samantha", lastname:"Gadet", email: "samantha.gadet@gmail.com", password: "abcdef", password_confirmation: "abcdef")

  end

  scenario "A user is taken to the home page once he is signed in" do
    # ACT
    visit login_path

    fill_in 'email', with: 'samantha.gadet@gmail.com'
    fill_in 'password', with: 'abcdef'
    click_on 'Submit'

  
    expect(page).to have_content ('Products')

    # DEBUG / VERIFY
    save_screenshot

  end
end
