class CreatePreOrderedSiteItems < ActiveRecord::Migration[7.2]
  def change
    create_table :pre_ordered_site_items do |t|
      t.references :pre_ordered_site, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
