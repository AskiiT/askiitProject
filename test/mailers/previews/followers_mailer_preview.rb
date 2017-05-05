# Preview all emails at http://localhost:3000/rails/mailers/followers_mailer
class FollowersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/followers_mailer/following
  def following
    FollowersMailer.following
  end

  # Preview this email at http://localhost:3000/rails/mailers/followers_mailer/followed
  def followed
    FollowersMailer.followed
  end

end
