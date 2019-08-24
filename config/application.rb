# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Portfolio
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false
    end
  end
end
