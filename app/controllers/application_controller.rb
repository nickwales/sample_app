 class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def user_name(id)
    name = User.find(id)
  end
  
end
