class DropMoviesTable < ActiveRecord::Migration
  def up
    drop_table :movies
  end

  def down
    create_table :movies
  end
end
