class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  helper_method :current_users_list
    protected
    def current_users_list
      current_users.map {|u| u.email}.join(", ")
    end

def not_authenticated
  redirect_to :login, :alert => "Please login first."
end

end
