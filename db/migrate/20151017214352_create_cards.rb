class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.text :card_text, null: false
      t.string :card_type, null: false
      t.string :monster_type
      t.string :family
      t.integer :attack
      t.integer :defense
      t.integer :level
      t.string :property

      t.timestamps null: false
    end
  end
end
