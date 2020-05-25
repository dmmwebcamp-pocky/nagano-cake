class UserMailer < ApplicationMailer
	default from: 'no-replay@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_welcome_mail.subject
  #
  def user_welcome_mail(customer)
    @customer = customer
	mail(to: @customer.email, subject: '会員登録完了のお知らせ')
  end
end