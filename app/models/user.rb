class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :first_name,:last_name,:email,presence:true
  validates :email, uniqueness: true
end