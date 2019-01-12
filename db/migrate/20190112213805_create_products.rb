class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.numeric :price
      t.integer :inventory_count

      t.timestamps
    end
  end
end
