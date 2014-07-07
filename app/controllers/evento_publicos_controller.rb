class EventoPublicosController < ApplicationController
  before_action :set_evento_publico, only: [:show, :edit, :update, :destroy]

  # GET /evento_publicos
  # GET /evento_publicos.json
  def index
    @evento_publicos = EventoPublico.all
  end

  # GET /evento_publicos/1
  # GET /evento_publicos/1.json
  def show
  end

  # GET /evento_publicos/new
  def new
    @evento_publico = EventoPublico.new
  end

  # GET /evento_publicos/1/edit
  def edit
  end

  # POST /evento_publicos
  # POST /evento_publicos.json
  def create
    @evento_publico = EventoPublico.new(evento_publico_params)

    respond_to do |format|
      if @evento_publico.save
        format.html { redirect_to @evento_publico, notice: 'Evento publico was successfully created.' }
        format.json { render :show, status: :created, location: @evento_publico }
      else
        format.html { render :new }
        format.json { render json: @evento_publico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evento_publicos/1
  # PATCH/PUT /evento_publicos/1.json
  def update
    respond_to do |format|
      if @evento_publico.update(evento_publico_params)
        format.html { redirect_to @evento_publico, notice: 'Evento publico was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento_publico }
      else
        format.html { render :edit }
        format.json { render json: @evento_publico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evento_publicos/1
  # DELETE /evento_publicos/1.json
  def destroy
    @evento_publico.destroy
    respond_to do |format|
      format.html { redirect_to evento_publicos_url, notice: 'Evento publico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento_publico
      @evento_publico = EventoPublico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_publico_params
      params.require(:evento_publico).permit(:nombre, :descripcion, :fechaRealizacion, :usuario_id)
    end
end