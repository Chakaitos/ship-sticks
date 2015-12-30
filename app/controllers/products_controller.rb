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
      prod = Product.create(product_params)

      render json: prod
    end
  end

  def index
    wrap_response do
      render json: products
    end
  end

  def show
    wrap_response do
      render json: product
    end
  end

  def find_best_match
    wrap_response do
      best_match = Product.best_match(length, width, height, weight)
      render json: best_match || { message: "There was no match for those dimensions" }
    end
  end

  def update
    wrap_response do
      product.update_attributes(product_params)
      render json: product
    end
  end

  def destroy
    wrap_response do
      product.destroy
      render json: { message: "Successfully deleted #{product.name}" }
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
