class DropMymbdsTable < ActiveRecord::Migration
  def up
    drop_table :mymdbs
  end

  def down
    create_table :mymdbs
  end
end
