require_relative 'boot'

require 'rails/all'
require 'mongoid' if defined?(Mongoid)
require 'devise' if defined?(Devise)
require 'active_model_serializers'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_controller.default_url_options = { host: 'test.host', port: nil }
    config.action_mailer.default_url_options = { host: 'test.host' }
  end
end
