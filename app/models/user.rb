class User < ActiveRecord::Base
  has_many :entries

  validates :username, :email, :password, presence: true

  has_secure_password
end
