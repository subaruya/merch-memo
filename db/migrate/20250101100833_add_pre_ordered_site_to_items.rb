class AddPreOrderedSiteToItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :pre_ordered_site, null: false, foreign_key: true
  end
end
