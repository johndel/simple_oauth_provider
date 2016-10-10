class SessionsController < ApplicationController
  def new
    if params[:app_name].nil? || OauthApplication.where('lower(name) = ?', params[:app_name].downcase).empty?
      redirect_to root_path
    elsif current_user
      oauth_app = OauthApplication.where('lower(name) = ?', params[:app_name].downcase).first
      redirect_to oauth_authorization_path(client_id: oauth_app.uid,
                                          redirect_uri: oauth_app.redirect_uri,
                                          response_type: 'code',
                                          scope: oauth_app.scopes)
    end
  end

  def create
    redirect_logged_in_user if current_user
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_logged_in_user
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def redirect_logged_in_user
      oauth_app = OauthApplication.where('lower(name) = ?', params[:app_name].downcase).first
      url = oauth_app.nil? ? root_path : login_path(app_name: params[:app_name])
      redirect_to url
    end
end