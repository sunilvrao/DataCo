class SessionsController < ApplicationController
  def create
    @user = User.send("find_for_#{params["provider"]}_oauth", request.env["omniauth.auth"], nil)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => params["provider"]
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
