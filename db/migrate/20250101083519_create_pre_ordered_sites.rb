class CreatePreOrderedSites < ActiveRecord::Migration[7.2]
  def change
    create_table :pre_ordered_sites do |t|
      t.timestamps
    end
  end
end
