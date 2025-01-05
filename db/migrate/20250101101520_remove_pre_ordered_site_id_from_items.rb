class RemovePreOrderedSiteIdFromItems < ActiveRecord::Migration[7.2]
  def change
    remove_column :items, :pre_ordered_site_id, :integer
  end
end
