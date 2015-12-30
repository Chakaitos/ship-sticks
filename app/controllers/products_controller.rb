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

  private
  def wrap_response
    if (block_given?)
      begin
        yield
      rescue => e
        failure_response e.message
      end
    end
  end

  def failure_response error
    render json: {
      message: error
    }, status: 400
  end
end
