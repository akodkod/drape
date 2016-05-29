require 'rails/railtie'

module ActiveModel
  class Railtie < Rails::Railtie
    generators do |app|
      app ||= Rails.application # Rails 3.0.x does not yield `app`

      Rails::Generators.configure! app.config.generators
      require_relative '../generators/controller_override'
    end
  end
end

module Drape
  class Railtie < Rails::Railtie

    config.after_initialize do |app|
      app.config.paths.add 'app/decorators', eager_load: true

      if Rails.env.test?
        require 'drape/test_case'
        require 'drape/test/rspec_integration' if defined?(RSpec) and RSpec.respond_to?(:configure)
      end
    end

    initializer 'drape.setup_action_controller' do |_app|
      ActiveSupport.on_load :action_controller do
        Drape.setup_action_controller self
      end
    end

    initializer 'drape.setup_action_mailer' do |_app|
      ActiveSupport.on_load :action_mailer do
        Drape.setup_action_mailer self
      end
    end

    initializer 'drape.setup_orm' do |_app|
      [:active_record, :mongoid].each do |orm|
        ActiveSupport.on_load orm do
          Drape.setup_orm self
        end
      end
    end

    initializer 'drape.setup_active_model_serializers' do |_app|
      ActiveSupport.on_load :active_model_serializers do
        if defined?(ActiveModel::ArraySerializerSupport)
          Drape::CollectionDecorator.send :include, ActiveModel::ArraySerializerSupport
        end
      end
    end

    initializer 'drape.minitest-rails_integration' do |_app|
      ActiveSupport.on_load :minitest do
        require 'drape/test/minitest_integration'
      end
    end

    console do
      require 'action_controller/test_case'
      ApplicationController.new.view_context
      Drape::ViewContext.build
    end

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
  end
end
