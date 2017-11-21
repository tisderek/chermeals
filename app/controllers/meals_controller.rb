class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    current_usser
    gifted_meals = Gift.pluck(:meal_id)
    taken_meals = Meal.all.where(id: gifted_meals)
    available_meals = Meal.all.to_a - taken_meals
end

  def show
  end

  def claim
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.provider = @user
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

    def meal_params
      params.require(:meal).permit(:title)
    end
end
