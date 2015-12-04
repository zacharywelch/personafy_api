class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :password, presence: { on: :create }
  validates :email,    presence: true, uniqueness: true
  validates :name,     presence: true

  has_many :personas

  def self.authenticate(email, password)
    user = find_by_email(email)

    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end