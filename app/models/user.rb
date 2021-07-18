class User < ApplicationRecord
    VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :username, presence: true, 
                         length: { minimum: 3, maximum: 20 }, 
                         uniqueness: { case_sensitive: false }
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      format: { with: VALID_EMAIL_EXPRESSION }
end