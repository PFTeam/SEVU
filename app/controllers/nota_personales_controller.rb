class NotaPersonalesController < ApplicationController
  before_action :set_nota_personal, only: [:show, :edit, :update, :destroy]

  # GET /nota_personales
  # GET /nota_personales.json
  def index
    @nota_personales = NotaPersonal.all
  end

  # GET /nota_personales/1
  # GET /nota_personales/1.json
  def show
  end

  # GET /nota_personales/new
  def new
    @nota_personal = NotaPersonal.new
  end

  # GET /nota_personales/1/edit
  def edit
  end

  # POST /nota_personales
  # POST /nota_personales.json
  def create
    @nota_personal = NotaPersonal.new(nota_personal_params)

    respond_to do |format|
      if @nota_personal.save
        format.html { redirect_to @nota_personal, notice: 'Nota personal was successfully created.' }
        format.json { render :show, status: :created, location: @nota_personal }
      else
        format.html { render :new }
        format.json { render json: @nota_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_personales/1
  # PATCH/PUT /nota_personales/1.json
  def update
    respond_to do |format|
      if @nota_personal.update(nota_personal_params)
        format.html { redirect_to @nota_personal, notice: 'Nota personal was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota_personal }
      else
        format.html { render :edit }
        format.json { render json: @nota_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_personales/1
  # DELETE /nota_personales/1.json
  def destroy
    @nota_personal.destroy
    respond_to do |format|
      format.html { redirect_to nota_personales_url, notice: 'Nota personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_personal
      @nota_personal = NotaPersonal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_personal_params
      params.require(:nota_personal).permit(:titulo, :descripcion, :fechaCreacion, :voluntario_id, :usuario_id)
    end
end
