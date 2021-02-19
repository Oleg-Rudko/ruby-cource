class ItemsController < ApplicationController
  layout false
  # curl -d "name=Iphone11&price=1100" -X POST http://localhost:5000/items
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
  end
  def create
    item = Item.create(items_params)
    if item.persisted?
      render body: item.name, status: :created
    else
      render body: item.errors, status: :unprocessable_entity
    end
  end

  def show
    unless(@item = Item.where(id: params[:id]).first)
      render body: "Page not found", status: 404
    end
  end

  private
  def items_params
    params.permit(:name, :price)
  end
end
