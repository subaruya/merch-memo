class StaticPagesController < ApplicationController
  def top
    render layout: false
  end
end
