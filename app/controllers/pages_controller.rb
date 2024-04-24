class PagesController < ApplicationController
  def home
    @article=utilisateur_courant.article.build if logged_in?
  end

  def aide
  end

  def contact        # ajouter
  end
end
