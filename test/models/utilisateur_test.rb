require "test_helper"

class UtilisateurTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @utilisateur =Utilisateur.new(nom: "prenom1 Nom1" ,email: "prenom1@example.com",
    password:"pppppp" , password_confirmation:"pppppp")
  end


  test "nom doit etre present" do
    @utilisateur.nom=""
    assert_not @utilisateur.valid?
  end
  test "email doit etre present" do
    @utilisateur.email=""
    assert_not @utilisateur.valid?
  end
  test "nom ne doit pas etre trop long" do
    @utilisateur.nom= "a" * 51
    assert_not @utilisateur.valid?
  end
  test "email ne doit pas etre trop long" do
    @utilisateur.email="a" * 244 + "@example.com"
    assert_not @utilisateur.valid?
  end
  test "email validation doit accepter les emails valides" do
    valid_addresses = %w[A@example.com AAA@example.COM]
    valid_addresses.each do |valid_address|
      @utilisateur.email=valid_address
      assert @utilisateur.valid?, "#{valid_address.inspect} doit etre valide"
    end
  end
  test "email doit etre unique" do
    duplicate_utilisateur = @utilisateur.dup
    duplicate_utilisateur.email=@utilisateur.email.upcase
    @utilisateur.save
    assert_not duplicate_utilisateur.valid?
  end

  test "mot de passe non vide"do
    @utilisateur.password = @utilisateur.password_confirmation = " "*6
    assert_not @utilisateur.valid?
  end
  test "mot de passe de 6 carac min" do
    @utilisateur.password = @utilisateur.password_confirmation = "a *5"
    assert_not @utilisateur.valid?
  end

end
