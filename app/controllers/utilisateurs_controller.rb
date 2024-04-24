class UtilisateursController < ApplicationController
  before_action :authenticate, only: [:index,:edit, :update,:destroy]
  before_action :bon_utilisateur, only: [:edit, :update]
  before_action :utilisateur_admin, only: :destroy


  def index
    @utilisateurs = Utilisateur.paginate(page: params[:page], per_page: 2)
  end


  def new
    @utilisateur = Utilisateur.new
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
    @articles=@utilisateur.article
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

  def authenticate
    unless logged_in?
      flash[:danger] = "Merci de vous connecter."
      redirect_to login_url
    end
  end

  def bon_utilisateur
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to(root_url) unless @utilisateur == utilisateur_courant
  end

  def destroy
    Utilisateur.find(params[:id]).destroy
    flash[:success]="utiisateur supprime"
    redirect_to root_url

  end


  def utilisateur_admin
    @utilisateur=Utilisateur.find(params[:id])
    if not @utilisateur_courant.admin? || @utilisateur==utilisateur_courant
      redirect_to(root_url)
    end

  end


end
