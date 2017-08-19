class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @properties = current_user.properties
  end

  def show
    @property = Property.find(params[:id])
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
    params.require(:property).permit(:titolo, :descrizione, :prezzo)
  end
end
