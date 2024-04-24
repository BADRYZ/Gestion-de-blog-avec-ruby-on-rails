class UtilisateursController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:success] = "Bienvenue!"
      redirect_to @utilisateur
    else
      render 'new'
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update(utilisateur_params)
      flash[:success] = "Profil actualisé"
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  private

  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :password, :password_confirmation)
  end
end
