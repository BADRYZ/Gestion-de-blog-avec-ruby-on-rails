class Utilisateur < ApplicationRecord
    has_many :article, dependent: :destroy

    validates :nom, presence: true, length: { maximum: 50 }
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL },
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
  end
