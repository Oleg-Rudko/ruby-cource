class Item < ApplicationRecord
  validates :price, :weight,  numireacality: { greater_than: 0, allow_nil: true }
  validates :name, presence :true

  after_initialize { p 'initalize'} #Item.first
  after_create     { p 'create'}    #Item.create => create and save
  after_save       { p 'save'}      #Item.save
  after_update     { p 'update'}    #Item.update => update and save
  after_destroy    { p 'destroy'}   #Item.destroy
end
