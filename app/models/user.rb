class User < ApplicationRecord

  has_secure_password

  validates :name, :password_confirmation, :email, presence: true
  validates :password, length: { minimum: 6 } 

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)
    
    if @user && @user.authenticate(password)
      return @user
    else 
      return nil 
    end

  end

end
