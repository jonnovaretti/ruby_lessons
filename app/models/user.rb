class User < ApplicationRecord
    VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { self.email = email.downcase }
    has_many :articles

    validates :username, presence: true, 
                         length: { minimum: 3, maximum: 20 }, 
                         uniqueness: { case_sensitive: false }
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      format: { with: VALID_EMAIL_EXPRESSION }
end