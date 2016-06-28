require 'rails_helper'

feature "user views show page for movie" do
  scenario "user clicks movie link to view details" do
    wick = FactoryGirl.create(:film)

    visit films_path

    expect(page).to have_content wick.title

    click_link "John Wick"

    expect(page).to have_content wick.title
    expect(page).to have_content wick.year
    expect(page).to have_content wick.description
    expect(page).to have_content wick.cast
    expect(page).to have_content wick.watched
  end
end
