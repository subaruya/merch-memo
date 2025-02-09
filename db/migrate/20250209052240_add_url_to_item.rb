class AddUrlToItem < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :url, :string
  end
end
