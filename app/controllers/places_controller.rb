class PlacesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index


  def index
    @places = Place.where(user: current_user)
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def new
    @place = Place.new
    # todo: si on ajoute un tag, le bouton pour rajouter un tag s'affiche
  end

  def create
    result = Places::CreateService.new(place_params, current_user).call
    if result[:success]
      place = result[:result]
      flash[:notice] = "Le restaurant #{place.name} a bien été ajouté à votre carte !"
      redirect_to places_path
    else
      flash[:alert] = result[:error]
      redirect_to new_place_path, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :kind, :description, :place_tags, :address)
  end
end
