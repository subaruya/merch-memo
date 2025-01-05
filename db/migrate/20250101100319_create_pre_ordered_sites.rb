class CreatePreOrderedSites < ActiveRecord::Migration[7.2]
  def change
    create_table :pre_ordered_sites do |t|
      t.string :name
      t.string :url

      t.timestamps

      t.reference :items, null: false, foreign_key: true
    end
    add_index :pre_ordered_sites, :name, unique: true
  end
end
