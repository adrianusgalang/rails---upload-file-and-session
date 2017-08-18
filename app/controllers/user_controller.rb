class UserController < ApplicationController
  def index
    @var1 = "haha"
    @var2 = "hihi"
    @session_user = "0"
    if session[:current_user_id] == "111222111222"
      @session_user = "1"
    end
  end


  def login
    session[:current_user_id] = "111222111222"
    #redirect_to controller: :kosan action: :index
    redirect_to url_for(:controller => :home, :action => :index)
  end

  def logout
    session.delete(:current_user_id)
    redirect_to url_for(:controller => :home, :action => :index)
  end
end
