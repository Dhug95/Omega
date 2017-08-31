class PrenotationsController < ApplicationController
  before_action :set_prenotation, only: [:show, :edit, :update, :destroy]

  # GET /prenotations
  # GET /prenotations.json
  def index
    @prenotations = Prenotation.all
  end

  # GET /prenotations/1
  # GET /prenotations/1.json
  def show
  end

  # GET /prenotations/new
  def new
    @prenotation = Prenotation.new
    @property_id = params[:property_id]
  end

  # GET /prenotations/1/edit
  def edit
  end

  # POST /prenotations
  # POST /prenotations.json
  def create
    @property = Property.find(params[:prenotation][:property_id])
    @prenotation = @property.prenotations.create(prenotation_params)

    respond_to do |format|
      if @prenotation.save
        format.html { redirect_to @prenotation, notice: 'Prenotation was successfully created.' }
        format.json { render :show, status: :created, location: @prenotation }
      else
        format.html { render :new }
        format.json { render json: @prenotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prenotations/1
  # PATCH/PUT /prenotations/1.json
  def update
    respond_to do |format|
      if @prenotation.update(prenotation_params)
        format.html { redirect_to @prenotation, notice: 'Prenotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @prenotation }
      else
        format.html { render :edit }
        format.json { render json: @prenotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prenotations/1
  # DELETE /prenotations/1.json
  def destroy
    @prenotation.destroy
    respond_to do |format|
      format.html { redirect_to prenotations_url, notice: 'Prenotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prenotation
      @prenotation = Prenotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prenotation_params
      params.require(:prenotation).permit(:name, :start_time, :end_time)
    end
end
