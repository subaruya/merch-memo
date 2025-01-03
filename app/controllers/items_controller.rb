class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, success: 'グッズ情報を登録しました'
    else
      flash.now[:danger] = 'グッズ情報の登録ができませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :pre_ordered_date, :release_date, :price, :note)
  end
end
