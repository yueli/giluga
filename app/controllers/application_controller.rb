class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def routing_error
    render "404", :status => 404
  end
  
end
