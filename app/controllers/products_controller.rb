class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @option_types = OptionType.all
    @option_values = OptionValue.all
  end

  def filter
    @products = filtered_products_by_options
    @filtered_products = @products
    @option_types = OptionType.all
    @option_values = OptionValue.all
    render :index
  end

  def show
    @variants = @product.variants
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :base_price)
  end

  def filtered_products_by_options
    products = Product.all

    if params[:option_type_id].present? && params[:option_value_id].present?
      products = products.joins(variants: { variant_option_values: { option_value: :option_type } })
                         .where(option_values: {
                           id: params[:option_value_id],
                           option_type_id: params[:option_type_id]
                         })
    elsif params[:option_value_id].present?
      products = products.joins(variants: { variant_option_values: :option_value })
                         .where(option_values: { id: params[:option_value_id] })
    elsif params[:option_type_id].present?
      products = products.joins(variants: { variant_option_values: { option_value: :option_type } })
                         .where(option_types: { id: params[:option_type_id] })
    end

    products.distinct
  end
end
