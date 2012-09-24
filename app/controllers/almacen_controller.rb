class AlmacenController < ApplicationController
  def index
    @products = Product.all
  end
end
