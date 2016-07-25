class AddFilmRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :film, index: true, foreign_key: true
  end
end
