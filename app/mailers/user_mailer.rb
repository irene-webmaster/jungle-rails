class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    @order = order
    @url  = "http://localhost:3000/cart"
    @subject = "Thanks for your order # #{@order.id}"
    mail(to: order.email, subject: @subject)
  end
end
