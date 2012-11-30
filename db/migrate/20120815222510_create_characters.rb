class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :alignment
      t.string :character_class
      t.string :permalink
      t.integer :level
      t.integer :experience
      t.integer :next_level
      t.text :skills
      t.text :spells
      t.integer :str, :dex, :con, :int, :wis, :cha
      t.timestamps
    end
  end
end
