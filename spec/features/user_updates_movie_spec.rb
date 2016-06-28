require 'rails_helper'

feature "user visits edit page" do

  scenario "user edits movie" do
    wick = FactoryGirl.create(:film)

    visit "/films"

    click_link "John Wick"
    click_link "Edit"

    fill_in "Title", with: wick.title
    fill_in "Year", with: "2015"
    fill_in "Description", with: "Lots of shooting"
    choose("film_watched_no")

    click_button "Submit"

    expect(page).to have_content "Movie successfully updated"
    expect(page).to have_content wick.title
    expect(page).to have_content "Lots of shooting"
  end
end
