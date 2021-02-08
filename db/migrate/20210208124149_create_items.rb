class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.float   :price
      t.float   :weight
      t.string  :name
      t.boolean :real

      t.timestamps
    end
  end
end
