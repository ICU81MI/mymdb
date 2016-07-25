class AddUserRefToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :user, index: true, foreign_key: true
  end
end
