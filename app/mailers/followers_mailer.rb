class FollowersMailer < ApplicationMailer
  default :from => 'staff@askiit.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.followers_mailer.following.subject
  #
  def following
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.followers_mailer.followed.subject
  #
  def followed( user, user_f )
    @user = user
    @user_f = user_f
    mail(
        :to => @user.email,
        :subject => "¡Tienes un nuevo seguidor en AskiiT!"
      )
  end
end
