class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.string :description
      t.string :rarity
      t.string :attunement

      t.timestamps
    end
  end
end
