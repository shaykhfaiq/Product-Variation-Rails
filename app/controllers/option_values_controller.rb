class OptionValuesController < ApplicationController
  before_action :set_option_type

  def index
    @option_values = @option_type.option_values
    @option_value = OptionValue.new
  end

  def create
    @option_value = @option_type.option_values.new(option_value_params)

    if @option_value.save
      redirect_to option_type_option_values_path(@option_type), notice: " Added."
    else
      @option_values = @option_type.option_values
      render :index
    end
  end

  def destroy
    @option_value = @option_type.option_values.find(params[:id])
    @option_value.destroy
    redirect_to option_type_option_values_path(@option_type), notice: "Deleted" 
  end

  private

  def set_option_type
    @option_type = OptionType.find(params[:option_type_id])
  end

  def option_value_params
    params.require(:option_value).permit(:value)
  end
end
