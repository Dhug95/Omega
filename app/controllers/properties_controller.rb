class PropertiesController < ApplicationController
  def index
    @properties= Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
  end

  def create
    @property = Property.new(property_params)
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


  private def property_params
    params.require(:property).permit(:titolo, :descrizione, :prezzo)
  end
end
