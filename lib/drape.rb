require 'action_view'
require 'active_model/naming'
require 'active_model/serialization'
require 'active_model/serializers/json'
require 'active_model/serializers/xml'
require 'active_support/inflector'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/hash/reverse_merge'
require 'active_support/core_ext/name_error'

require 'drape/version'
require 'drape/view_helpers'
require 'drape/delegation'
require 'drape/automatic_delegation'
require 'drape/finders'
require 'drape/decorator'
require 'drape/helper_proxy'
require 'drape/lazy_helpers'
require 'drape/decoratable'
require 'drape/factory'
require 'drape/decorated_association'
require 'drape/helper_support'
require 'drape/view_context'
require 'drape/collection_decorator'
require 'drape/undecorate'
require 'drape/decorates_assigned'
require 'drape/railtie' if defined?(Rails)

module Drape
  def self.setup_action_controller(base)
    base.class_eval do
      include Drape::ViewContext
      extend Drape::HelperSupport
      extend Drape::DecoratesAssigned

      before_action :activate_drape
    end
  end

  def self.setup_action_mailer(base)
    base.class_eval do
      include Drape::ViewContext
    end
  end

  def self.setup_orm(base)
    base.class_eval do
      include Drape::Decoratable
    end
  end

  class UninferrableDecoratorError < NameError
    def initialize(klass)
      super("Could not infer a decorator for #{klass}.")
    end
  end

  class UninferrableSourceError < NameError
    def initialize(klass)
      super("Could not infer a source for #{klass}.")
    end
  end
end
