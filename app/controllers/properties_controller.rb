class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @properties = current_user.properties.page params[:page]
  end

  def show
    @property = Property.find(params[:id])
    media(@property)
  end

  def media(property)
    @counter = 0
    @valutazione = 0
    property.reviews.each do |r|
      @valutazione = @valutazione + r.valutation
      @counter = @counter +1
    end
    if @counter==0
      @counter=1
    end
    @valutazione = @valutazione/@counter
    if @valutazione.modulo(1)>0.5
      @valutazione = @valutazione + 1
    end
    property.valutation = @valutazione
  end

  def add_to_f
    @property = Property.find(params[:id])
    current_user.favourites << @property
    redirect_to @property
  end

  def remove_from_f
    @property = Property.find(params[:id])
    current_user.favourites.delete(@property)
    redirect_to @property
  end

  def follow
    @property = Property.find(params[:id])
    current_user.followings << @property.user
    redirect_to @property
  end

  def unfollow
    @property = Property.find(params[:id])
    current_user.followings.delete(@property.user)
    redirect_to @property
  end

  def new
  end

  def create
    @property = current_user.properties.build(property_params)
    @property.save
    redirect_to @property
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if(@property.update(property_params))
        redirect_to @property
    else
        render 'edit'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to properties_path
  end


  private def property_params
    params.require(:property).permit(:titolo, :descrizione, :prezzo, :city, :img1, :img2, :img3)
  end
end
