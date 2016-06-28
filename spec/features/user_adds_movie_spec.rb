# require 'rails_helper'
#
# feature "visitor adds movie" do
#   let (:fake_title) {"Deadpool"}
#   let (:fake_year) {"2016"}
#
#   scenario "visitor adds movie" do
#     visit new_film_path
#
#     fill_in "Title" with fake_title
#     fill_in "Year" with fake_year
#     choose("Yes")
#     click_button "Submit"
