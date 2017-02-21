class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    puts order.email

    @url  = 'http://localhost:3000/cart'
    mail(to: order.email, subject: 'Thanks for your order')
  end
end
