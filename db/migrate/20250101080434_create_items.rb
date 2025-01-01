class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.timestamps
    end
  end
end
