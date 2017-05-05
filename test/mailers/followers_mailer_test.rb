require 'test_helper'

class FollowersMailerTest < ActionMailer::TestCase
  test "following" do
    mail = FollowersMailer.following
    assert_equal "Following", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "followed" do
    mail = FollowersMailer.followed
    assert_equal "Followed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
