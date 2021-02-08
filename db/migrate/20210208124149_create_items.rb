class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.float   :price
      t.float   :weight
      t.string  :name
      t.boolean :real
      t.string  :description
      t.timestamps
    end
    add_index :items, :price
    add_index :items, :name
  end
end
