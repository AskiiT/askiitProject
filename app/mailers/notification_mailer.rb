class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notificate.subject
  #

  ##
  # 	Types:
  #			1 - Report
  #			2 - Postulate
  #			3 - Subscribed to tag
  ##
  def notificate( type, body, user )
    @body = body
    @user = user
    @message=""
    case type
    		when 1
    			@message = "Tu pregunta ha sido reportada."
    		when 11
    			@message = "Una pregunta ha sido reportada por la comunidad."
    		when 2
    			@message = "¡Un usuario se ha postulado a tu pregunta!"
    		when 3
    			@message = "¡Alguien ha publicado una pregunta que te puede interesar!"
    		end

    mail(
    		:to => @user.email,
    		
    		:subject => @message
    	)
  end
end
