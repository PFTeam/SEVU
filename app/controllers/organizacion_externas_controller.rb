class OrganizacionExternasController < ApplicationController
  before_action :set_organizacion_externa, only: [:show, :edit, :update, :destroy]

  # GET /organizacion_externas
  # GET /organizacion_externas.json
  def index
    @organizacion_externas = OrganizacionExterna.page(params[:page]).search query: params[:q]
  end

  # GET /organizacion_externas/1
  # GET /organizacion_externas/1.json
  def show
  end

  # GET /organizacion_externas/new
  def new
    @organizacion_externa = OrganizacionExterna.new
  end

  # GET /organizacion_externas/1/edit
  def edit
  end

  # POST /organizacion_externas
  # POST /organizacion_externas.json
  def create
    @organizacion_externa = OrganizacionExterna.new(organizacion_externa_params)

    respond_to do |format|
      if @organizacion_externa.save
        format.js {render partial: 'proyectos/crear_organizacion_externa', content_type: 'text/html'}
        format.html { redirect_to @organizacion_externa, notice: 'Organizacion externa was successfully created.' }
        format.json { render :show, status: :created, location: @organizacion_externa }

      else
        format.html { render :new }
        format.json { render json: @organizacion_externa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizacion_externas/1
  # PATCH/PUT /organizacion_externas/1.json
  def update
    respond_to do |format|
      if @organizacion_externa.update(organizacion_externa_params)
        format.html { redirect_to @organizacion_externa, notice: 'Organizacion externa was successfully updated.' }
        format.json { render :show, status: :ok, location: @organizacion_externa }
      else
        format.html { render :edit }
        format.json { render json: @organizacion_externa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizacion_externas/1
  # DELETE /organizacion_externas/1.json
  def destroy
    @organizacion_externa.destroy
    respond_to do |format|
      format.html { redirect_to organizacion_externas_url, notice: 'Organizacion externa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizacion_externa
      @organizacion_externa = OrganizacionExterna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizacion_externa_params
      params.require(:organizacion_externa).permit(:sigla, :denominacion, :cuit, :direccion, :fax, :telefono, :nombreResponsable, :cargoResponsable, :numeroContactoResponsable)
    end
end
