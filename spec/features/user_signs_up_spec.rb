require 'rails_helper'

feature "User signs up" do
  scenario "user creates account by completing new user form" do
    visit new_user_session_path

    expect(page).to have_content "You need to sign in or sign up before continuing."

    click_link "Sign up"

    fill_in "Email", with: "person@gmail.com"
    fill_in "Password", with: "asdf1234"
    fill_in "Password confirmation", with: "asdf1234"
    click_button "Sign Up"

    expect(page).to have_content "Welcome! You have signed up successfully."
      
  end
end
