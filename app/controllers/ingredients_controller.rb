class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.order(:name)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(permitted_params)
    @ingredient.user = @current_user
    if @ingredient.save
      redirect_to(@ingredient)
    else
      render "new"
    end
  end

  private

  def permitted_params
    params.require(:ingredient).permit(:description, :fresh, :name)
  end
end
