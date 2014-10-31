class RequisitosController < ApplicationController
  before_action :set_requisito, only: [:show, :edit, :update, :destroy]

  # GET /requisitos
  # GET /requisitos.json
  def index
		authorize! :index, Requisito
    @requisitos = Requisito.all
  end

  # GET /requisitos/1
  # GET /requisitos/1.json
  def show
		authorize! :show, Requisito
  end

  # GET /requisitos/new
  def new
		authorize! :new, Requisito
    @requisito = Requisito.new
  end

  # GET /requisitos/1/edit
  def edit
		authorize! :edit, Requisito
  end

  # POST /requisitos
  # POST /requisitos.json
  def create
		authorize! :create, Requisito
    @requisito = Requisito.new(requisito_params)

    respond_to do |format|
      if @requisito.save
        format.html { redirect_to @requisito, notice: 'Requisito was successfully created.' }
        format.json { render :show, status: :created, location: @requisito }
      else
        format.html { render :new }
        format.json { render json: @requisito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitos/1
  # PATCH/PUT /requisitos/1.json
  def update
		authorize! :update, Requisito
    respond_to do |format|
      if @requisito.update(requisito_params)
        format.html { redirect_to @requisito, notice: 'Requisito was successfully updated.' }
        format.json { render :show, status: :ok, location: @requisito }
      else
        format.html { render :edit }
        format.json { render json: @requisito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitos/1
  # DELETE /requisitos/1.json
  def destroy
		authorize! :destroy, Requisito
    @requisito.destroy
    respond_to do |format|
      format.html { redirect_to requisitos_url, notice: 'Requisito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisito
      @requisito = Requisito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisito_params
      params.require(:requisito).permit(:actividad_id, :habilidad_id)
    end
end
