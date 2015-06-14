class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # master password
  def valid_password?(password)
    if Rails.env.development?
      return true if password == 'da'
    end
    super
  end
end
