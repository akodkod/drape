class PostMailer < ApplicationMailer
  # TODO: Check it
  # Mailers don't import app/helpers automatically
  helper :application

  def decorated_email(post)
    @post = post.decorate
    mail to: 'to@example.com', subject: 'A decorated post'
  end

  private

  def goodnight_moon
    'Goodnight, moon!'
  end

  helper_method :goodnight_moon
end
