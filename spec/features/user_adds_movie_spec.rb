require 'rails_helper'

feature "visitor adds movie" do

  scenario "visitor adds movie" do
    visit new_film_path

    expect(page).to have_content "Add a Movie"

    fill_in "Title", with: "Deadpool"
    fill_in "Year", with: "2016"
    choose("film_watched_yes")
    click_button "Add Movie"

    expect(page).to have_content "Movie added successfully"
    expect(page).to have_content "Deadpool"
  end
end
