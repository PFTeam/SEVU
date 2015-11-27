class RegionalesController < ApplicationController
  before_action :set_regional, only: [:show, :edit, :update, :destroy]

  # GET /regionales
  # GET /regionales.json
  def index
		authorize! :index, Regional
    @regionales = Regional.all
  end

  # GET /regionales/1
  # GET /regionales/1.json
  def show
		authorize! :show, Regional
  end

  # GET /regionales/new
  def new
		authorize! :new, Regional
    @regional = Regional.new
  end

  # GET /regionales/1/edit
  def edit
		authorize! :edit, Regional
  end

  # POST /regionales
  # POST /regionales.json
  def create
		authorize! :create, Regional
    @regional = Regional.new(regional_params)
    respond_to do |format|
      if @regional.save
				sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Creación de la Regional #{@regional.attributes}",
    				sesion_id: sesion.id
				)
        format.html { redirect_to @regional, notice: 'Regional was successfully created.' }
        format.json { render :show, status: :created, location: @regional }
      else
        format.html { render :new }
        format.json { render json: @regional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regionales/1
  # PATCH/PUT /regionales/1.json
  def update
		authorize! :update, Regional
    respond_to do |format|
			sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Actualización de la Regional: #{@regional.previous_changes}",
    				sesion_id: sesion.id
				)
      if @regional.update(regional_params)
        format.html { redirect_to @regional, notice: 'Regional was successfully updated.' }
        format.json { render :show, status: :ok, location: @regional }
      else
        format.html { render :edit }
        format.json { render json: @regional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regionales/1
  # DELETE /regionales/1.json
  def destroy
		authorize! :destroy, Regional
		sesion= Sesion.find_by(usuario_id: current_usuario.id, fechaFin: nil)
				Transaccion.create!(
    				descripcion: "Borrado de la Regional #{@regional.attributes}",
    				sesion_id: sesion.id
				)
    @regional.destroy
    respond_to do |format|
      format.html { redirect_to regionales_url, notice: 'Regional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regional
      @regional = Regional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regional_params
      params.require(:regional).permit(:nombre, :domicilio, :telefono_contacto, :nombre_contacto)
    end
end
