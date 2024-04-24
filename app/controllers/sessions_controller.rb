class SessionsController < ApplicationController
  def new
  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
    else
      flash[:danger] = 'Combinaison email/mot de passe invalide'
      render 'new'
    end
  end
end
