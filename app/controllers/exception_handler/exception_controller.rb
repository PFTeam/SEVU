module ExceptionHandler
  class ExceptionController < ApplicationController

    #Response
    respond_to :html, :xml, :json

  	#Dependencies
  	before_action :status, :app_details

    #Layout
    layout :layout_status


    def show
      @layout = self.send(:_layout)
      @message = "Disculpe, esta página no existe  :)" if @status == 500
      @message = "Disculpe, esta página no existe  :)" if @status == 404

      #@message = "Disculpe, esta página no existe  :)"
      render status: @status
    end


    protected

    #Info
    def status
      @exception  = env['action_dispatch.exception']
      @status     = ActionDispatch::ExceptionWrapper.new(env, @exception).status_code
      @response   = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]
    end


    private

    #Layout
    def layout_status
      case  @status
        when 404
          ExceptionHandler.config.error_layout || nil #-> inherits ApplicationController layout
        else
          ExceptionHandler.config.error_layout || nil #-> inherits ApplicationController layout
      end     
    end

    #App
    def app_details
      @app_name = Rails.application.class.parent_name
    end

  end
end
