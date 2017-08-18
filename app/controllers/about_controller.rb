class AboutController < ApplicationController
  def index
    @session_user = "0"
    if session[:current_user_id] == "111222111222"
      @session_user = "1"
    end
  end
end
