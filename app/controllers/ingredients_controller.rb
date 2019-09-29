class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.where(account: current_user.account).order(:name)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id], account: current_user.account)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(permitted_params)
    @ingredient.account = current_user&.account
    if @ingredient.save
      flash[:success] = "Ingredient created successfully"
      redirect_to(@ingredient)
    else
      render "new"
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    name = @ingredient&.name
    if @ingredient&.delete
      flash[:success] = "Ingredient '#{name}' successfully removed"
    else
      flash[:error] = "Ingredient could not be removed"
    end
    redirect_to(ingredients_path)
  end

  private

  def permitted_params
    params.require(:ingredient).permit(:description, :fresh, :name)
  end
end
