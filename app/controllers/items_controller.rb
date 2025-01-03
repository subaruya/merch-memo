class ItemsController < ApplicationController
  def index
    @items = Item
    .order(Arel.sql("COALESCE(release_date, '9999-12-31') ASC, pre_ordered_date ASC"))
    # 年月日だけでソートしているので時刻部分が考慮されない。
    # 同日内で時刻によるソートが必要になった場合は要調整
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    # 入力された予約サイト名を確認して処理
    pre_ordered_site = PreOrderedSite.find_or_create_by(name: params[:item][:pre_ordered_site_name])
  
    # アイテム作成処理
    @item = current_user.items.build(item_params)
    @item.pre_ordered_site_id = pre_ordered_site.id
  
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
