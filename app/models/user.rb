class User < ApplicationRecord
	validates :username, presence: true, 
											uniqueness: { case_sensitive: false }, 
											length: { minimum: 3, maximum: 25 }
	EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[a-z]+\z/
	validates :email, presence: true, 
											uniqueness: { case_sensitive: false }, 
											length: { maximum: 105 },
											format: { with: EMAIL_REGEX }

	
end