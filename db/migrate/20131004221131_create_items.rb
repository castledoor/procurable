class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :image_link
      t.decimal :price
      t.integer :store_id
    end
  end
end
