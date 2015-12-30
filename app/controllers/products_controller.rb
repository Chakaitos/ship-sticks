class ProductsController < ApplicationController

  expose(:id)       { params[:id] }
  expose(:name)     { params[:name] }
  expose(:type)     { params[:type] }
  expose(:length)   { params[:length] }
  expose(:width)    { params[:width] }
  expose(:height)   { params[:height] }
  expose(:weight)   { params[:weight] }
  expose(:product)  { Product.find(id) }
  expose(:products) { Product.all }

end
