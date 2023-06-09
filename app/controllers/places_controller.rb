class PlacesController < ApplicationController

  def index
    if @current_user
    @places = Place.all
    else 
      redirect_to "/login"
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
    @posts = Post.where({ "user_id" => @current_user["id"] })
    @posts = Post.where({ "username" => @current_user["username"] })
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

end
