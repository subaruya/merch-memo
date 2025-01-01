class ItemsController < ApplicationController
  def index
    @boards = Item.all
  end
end
