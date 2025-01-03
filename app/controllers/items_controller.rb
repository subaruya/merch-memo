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
    @item = current_user.items.find(params[:id])
    @pre_ordered_site_name = @item.pre_ordered_site.name
  end

  def update
    @item = current_user.items.find(params[:id])
    # 入力された予約サイト名を優先的に表示
    @pre_ordered_site_name = params[:item][:pre_ordered_site_name] || @item.pre_ordered_site.name
  
    # 予約サイト名を更新、または新規作成
    pre_ordered_site = PreOrderedSite.find_or_create_by(name: params[:item][:pre_ordered_site_name])
    @item.pre_ordered_site_id = pre_ordered_site.id
  
    # 他のカラムを更新
    if @item.update(item_params)
      redirect_to item_path(@item), success: 'グッズ情報を更新しました'
    else
      flash.now[:danger] = '編集が保存できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy!
    redirect_to items_path, success: 'グッズ情報を削除しました'
  end

  private

  def item_params
    params.require(:item).permit(:name, :pre_ordered_date, :release_date, :price, :note)
  end
end
