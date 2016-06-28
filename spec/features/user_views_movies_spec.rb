require 'rails_helper'

feature "User sees list of movies" do
  scenario "user sees list of movies and link to add new movie" do
    wick = FactoryGirl.create(:film)
    pool = FactoryGirl.create(:film, title: "Deadpool", year: "2016", watched: "No")

    visit films_path

    expect(page).to have_content wick.title
    expect(page).to have_content pool.title

    click_link "Add a Movie"

    expect(page).to have_content "Add a Movie"

  end
end
