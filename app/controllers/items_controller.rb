class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    render body: @items.map { |i| "#{i.name}: #{i.price}"}
  end
  def create
    item = Item.create(items_params)
    if item.persisted?
      render body: item.name, status: :created
    else
      render body: item.errors, status: :unprocessable_entity
    end
  end

  private
  def items_params
    params.permit(:name, :price)
  end
end
