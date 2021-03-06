class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    plain_email = email.strip
    user = User.find_by_email(plain_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
