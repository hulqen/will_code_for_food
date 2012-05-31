# encoding: utf-8
class SessionsController < ApplicationController

  def index
  end

  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Inloggad! Välkommen " + user.email
    else
      flash.now.alert = "Felaktigt lösenord eller användarnamn"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Utloggad!"
  end
end