class NotificacionEmailesController < ApplicationController
  before_action :set_notificacion_email, only: [:show, :edit, :update, :destroy]

  # GET /notificacion_emailes
  # GET /notificacion_emailes.json
  def index
    @notificacion_emailes = NotificacionEmail.all
  end

  # GET /notificacion_emailes/1
  # GET /notificacion_emailes/1.json
  def show
  end

  # GET /notificacion_emailes/new
  def new
    @notificacion_email = NotificacionEmail.new
  end

  # GET /notificacion_emailes/1/edit
  def edit
  end

  # POST /notificacion_emailes
  # POST /notificacion_emailes.json
  def create
    @notificacion_email = NotificacionEmail.new(notificacion_email_params)

    respond_to do |format|
      if @notificacion_email.save
        format.html { redirect_to @notificacion_email, notice: 'Notificacion email was successfully created.' }
        format.json { render :show, status: :created, location: @notificacion_email }
      else
        format.html { render :new }
        format.json { render json: @notificacion_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificacion_emailes/1
  # PATCH/PUT /notificacion_emailes/1.json
  def update
    respond_to do |format|
      if @notificacion_email.update(notificacion_email_params)
        format.html { redirect_to @notificacion_email, notice: 'Notificacion email was successfully updated.' }
        format.json { render :show, status: :ok, location: @notificacion_email }
      else
        format.html { render :edit }
        format.json { render json: @notificacion_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacion_emailes/1
  # DELETE /notificacion_emailes/1.json
  def destroy
    @notificacion_email.destroy
    respond_to do |format|
      format.html { redirect_to notificacion_emailes_url, notice: 'Notificacion email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion_email
      @notificacion_email = NotificacionEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_email_params
      params.require(:notificacion_email).permit(:destinatario, :remitente, :asunto)
    end
end
