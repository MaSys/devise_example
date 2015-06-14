class UserMailer < ApplicationMailer
  default from: 'da7emas@gmail.com'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'New registration')
  end
end
