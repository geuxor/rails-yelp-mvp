class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :edit, :update, :edit, :show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    
  end
  
  def new
    @restaurant = Restaurant.new
  end

  def create # do with form
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
      # redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def edit
  end
  
  def update  # do with form
    find_restaurant
    
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
      # redirect_to restaurant_path
    else
      render :edit
    end
  end
  

  def destroy
    find_restaurant
    @restaurant.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end

  
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
  
end
