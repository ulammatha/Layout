class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :correct_user, except:[:index,:show,:new,:create]
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all.order("created_at DESC").paginate(:page => params[:page],:per_page => 2)
    #raise @restaurants.inspect

  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
   
    @restaurant =current_user.restaurants.build
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant =current_user.restaurants.build(restaurant_params)
 
=begin
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
=end
  if @restaurant.save
     redirect_to action: 'index', notice: 'pin was successfully created.' 

    #render action: 'show', status: :created, location:@pin
  else    
  end
end
  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
    def correct_user
      @restaurant = current_user.restaurants.find_by(id: params[:id])
      redirect_to restaurants_path, notice: 'Not Authorised to do the changes.' if @restaurant.nil?
     end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:rid, :user_id, :name, :place, :city, :description, :image)
    end
end
