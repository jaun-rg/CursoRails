class DireccionesController < ApplicationController
  before_action :set_direccione, only: [:show, :edit, :update, :destroy]

  # GET /direcciones
  # GET /direcciones.json
  def index
    @direcciones = Direccione.all

    @hash = Gmaps4rails.build_markers(
    		@direcciones.where(:gmaps=> true)) do |dir, marker|
     #@hash = Gmaps4rails.build_markers(@direcciones) do |dir, marker|
    	 marker.lat dir.latitude
    	 marker.lng dir.longitude
    	 marker.infowindow  dir.address	
    end
  end

  # GET /direcciones/1
  # GET /direcciones/1.json
  def show
  end

  # GET /direcciones/new
  def new
    @direccione = Direccione.new
  end

  # GET /direcciones/1/edit
  def edit
  end

  # POST /direcciones
  # POST /direcciones.json
  def create
    @direccione = Direccione.new(direccione_params)

    respond_to do |format|
      if @direccione.save
        format.html { redirect_to @direccione, notice: 'Direccione was successfully created.' }
        format.json { render action: 'show', status: :created, location: @direccione }
      else
        format.html { render action: 'new' }
        format.json { render json: @direccione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direcciones/1
  # PATCH/PUT /direcciones/1.json
  def update
    respond_to do |format|
      if @direccione.update(direccione_params)
        format.html { redirect_to @direccione, notice: 'Direccione was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @direccione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direcciones/1
  # DELETE /direcciones/1.json
  def destroy
    @direccione.destroy
    respond_to do |format|
      format.html { redirect_to direcciones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direccione
      @direccione = Direccione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direccione_params
      params.require(:direccione).permit(:address, :longitude, :latitude, :gmaps)
    end
end
