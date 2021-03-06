class User < ApplicationRecord
    has_many :articles
    before_save { self.email = email.downcase }
    
    # Validations for username field for data-input
    validates :username, presence: true, 
               uniqueness: { case_sensitive: false }, 
               length: { minimum: 3, maximum: 25 }

    # Validations for email field for data-input
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
               uniqueness: { case_sensitive: false },
               format: { with: VALID_EMAIL_REGEX }

    has_secure_password
end