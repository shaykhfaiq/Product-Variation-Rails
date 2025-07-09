class ProductOptionTypesController < ApplicationController

    def create
        @product = Product.find(params[:product_id])
        @option_type = OptionType.find(params[:option_type_id])
        
        unless @product.option_types.include?(@option_type)
            @product.option_types << @option_type
            redirect_to product_path(@product), notice: "Option type added."
        else
            redirect_to product_path(@product), alert: "Option type already assigned."
        end
  
    end
    def  destroy
        @product = Product.find(params[:product_id])
        @option_type = @product.option_types.find(params[:id])
        
        if @option_type.destroy
            redirect_to product_path(@product), notice: "Deleted."
        else
            redirect_to product_path(@product), alert: "Failed ."
        end
    end
    def option_type_params
        params.require(:option_type).permit(:name, :description)
    end
end
