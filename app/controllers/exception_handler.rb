module ExceptionHandler
  class ExceptionController < ApplicationController

    #Response
    respond_to :html, :xml, :json

  	#Dependencies
  	before_action :status, :app_details

    #Layout
    layout :layout_status

    #Helper
    #http://stackoverflow.com/questions/9809787/why-is-my-rails-mountable-engine-not-loading-helper-methods-correctly
    helper ExceptionHandler::ApplicationHelper

    ####################
    #      Action      #
    ####################

  	#Show
    def show
      @layout = self.send(:_layout)
      @message = (/^(5[0-9]{2})$/ !~ @status.to_s) ? "Sorry, this page is missing 2" : details[:message]

      ## Config "404 block" handler ##
      if /^(5[0-9]{2})$/ !~ @status.to_s && ExceptionHandler.config["404"] 
        eval ExceptionHandler.config["404"]
      else
        ## Render (if eval do anything) ##
        render status: @status
      end
    end

    ####################
    #   Dependencies   #
    ####################

    protected

    #Info
    def status
      @exception  = env['action_dispatch.exception']
      @status     = ActionDispatch::ExceptionWrapper.new(env, @exception).status_code
      @response   = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]
    end
end
end
