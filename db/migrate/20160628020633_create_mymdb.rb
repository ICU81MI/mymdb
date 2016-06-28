class CreateMymdb < ActiveRecord::Migration
  def change
    create_table :mymdbs do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.text :cast
      t.text :description
      t.string :watched, null: false

      t.timestamps null: false
    end
  end
end
