class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :card_id, null:false
      t.string :set_name, null: false
      t.string :print_tag, null: false
      t.string :rarity, null: false
      t.timestamps null: false
    end
  end
end
