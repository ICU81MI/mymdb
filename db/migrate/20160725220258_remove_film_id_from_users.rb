class RemoveFilmIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :film_id, :integer
  end
end
