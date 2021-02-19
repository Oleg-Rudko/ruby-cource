class ItemsController < ApplicationController
  layout false
  # curl -d "name=Iphone11&price=1100&description=Ok" -X POST http://localhost:5000/items
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

  def new; end

  def show
    unless(@item = Item.find_by(id: params[:id]))
      render body: "Page not found", status: 404
    end
  end

  def destroy
    item = Item.find_by(id: params[:id]).destroy
    if item.destroyed?
      redirect_to items_path
    else
      render body: item.errors, status: :unprocessable_entity
    end
  end

  private
  def items_params
    params.permit(:name, :price, :weight, :description)
  end
end
