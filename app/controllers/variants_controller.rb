class VariantsController < ApplicationController
  before_action :set_product
  before_action :set_variant, only: [:destroy]

  def index
    @variants = @product.variants.includes(:option_values)
  end

  def new
    @variant = @product.variants.new
  end

  def create
    @variant = @product.variants.new(variant_params)
    if params[:option_value_ids]
      @variant.option_value_ids = params[:option_value_ids].values
    end

  if @variant.save
    redirect_to product_variants_path(@product), notice: 'Variant created.'
  else
    render :new
  end
 end

  def destroy
    @variant.destroy
    redirect_to product_variants_path(@product), notice: "Variant deleted."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_variant
    @variant = @product.variants.find(params[:id])
  end

  def variant_params
    params.require(:variant).permit(:sku, :price, :stock_quantity)
  end
end



