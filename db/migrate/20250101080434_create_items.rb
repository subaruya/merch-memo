class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :pre_ordered_site_id, null: false
      t.datetime :pre_ordered_date
      t.datetime :release_date
      t.decimal :price
      t.text :note
      t.timestamps

      t.references :user, foreign_key: true
    end
  end
end
