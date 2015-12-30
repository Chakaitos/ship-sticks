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
  expose(:product_params) {
    {
      name: name,
      type: type,
      length: length,
      width: width,
      height: height,
      weight: weight
    }
  }

  def create
    wrap_response do
      prod = Product.create!(product_params)

      render json: prod
    end
  end

  def index
    render json: products
  end

  def update
    product.update_attributes(product_params)
    render json: product
  end

  def delete
    message = "Successfully deleted #{product.name}"
    product.destroy
    render json: message
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
