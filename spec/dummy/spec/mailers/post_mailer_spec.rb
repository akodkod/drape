require 'spec_helper'

describe PostMailer do
  describe '#decorated_email' do
    let(:email_body) { Capybara.string(email.body.to_s) }
    let(:email) { PostMailer.decorated_email(post).deliver }
    let(:post) { Post.create }

    it 'decorates' do
      expect(email_body).to have_content 'Today'
    end

    it 'can use path helpers with a model' do
      expect(email_body).to_not have_css '#path_with_model'
    end

    it 'can use path helpers with an id' do
      expect(email_body).to_not have_css '#path_with_id'
    end

    it 'can use url helpers with a model' do
      expect(email_body).to have_css '#url_with_model', text: "http://test.host/posts/#{post.id}"
    end

    it 'can use url helpers with an id' do
      expect(email_body).to have_css '#url_with_id', text: "http://test.host/posts/#{post.id}"
    end

    it 'uses the correct view context controller' do
      expect(email_body).to have_css '#controller', text: 'PostMailer'
    end
  end
end
