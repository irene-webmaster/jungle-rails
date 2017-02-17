class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/cart'
    mail(to: @user.email, subject: 'Thanks for your order')
  end
end
