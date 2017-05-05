require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "notificate" do
    mail = NotificationMailer.notificate
    assert_equal "Notificate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
