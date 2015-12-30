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

  def create
    wrap_response do
      prod = Product.create(
        name: name,
        type: type,
        length: length,
        width: width,
        height: height,
        weight: weight
      )

      render json: prod
    end
  end
end
