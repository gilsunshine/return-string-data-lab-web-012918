class ProductsController < ApplicationController

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory && product.inventory > 0
      return "true"
    else
      return "false"
    end

  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
