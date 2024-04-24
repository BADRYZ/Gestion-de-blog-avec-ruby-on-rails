module SessionsHelper
  def log_in(utilisateur)
    session[:utilisateur_id]=utilisateur.id
  end
end
