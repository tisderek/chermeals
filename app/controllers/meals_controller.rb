class MealsController < ApplicationController
  before_action :set_meal, :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :set_provider

  def index
    taken_meals_from_gifts = Gift.pluck(:meal_id)
    @taken_meals = Meal.all.where(id: taken_meals_from_gifts)
    # binding.pry
    @available_meals = Meal.all.to_a - @taken_meals
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create

    @meal = Meal.new(meal_params)
    @meal.provider = @provider
    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def set_provider
      @provider = User.first
    end

    def meal_params
      params.require(:meal).permit(:title)
    end
end
