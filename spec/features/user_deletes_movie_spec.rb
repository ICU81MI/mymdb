require 'rails_helper'

feature "user visits edit page" do
  scenario "user edits movie" do
    wick = FactoryGirl.create(:film)

    visit "/films"

    click_link "John Wick"
    click_link "Edit"
    click_button "Delete Movie"

    expect(page).to have_content("Movie deleted")
    expect(page).to_not have_content(wick.title)
  end
end
