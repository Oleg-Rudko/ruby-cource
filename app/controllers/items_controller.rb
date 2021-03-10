class ItemsController < ApplicationController
  layout false
  # curl -d "name=Iphone11&price=1100&description=Ok" -X POST http://localhost:5000/items
  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit update destroy]
  before_action :admin?, only: %i[edit update new create destroy]

  def index
    @items = Item.all
  end
  def create
    item = Item.create(items_params)
    if item.persisted?
      redirect_to items_path
    else
      render body: item.errors, status: :unprocessable_entity
    end
  end

  def new; end

  def show
    render body: "Page not found", status: 404 unless @item
  end

  def edit
    unless(@item)
      render body: "Page not found", status: 404
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
    redirect_to items_path
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render body: item.errors, status: :unprocessable_entity
    end
  end

  private
  def items_params
    params.permit(:name, :price, :weight, :description)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end

  def admin?
    render json: 'Access denied', status: :forbidden unless params[:admin]
  end
end
