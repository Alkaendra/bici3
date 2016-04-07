require File.expand_path('../boot', __FILE__)

require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
# Pick the frameworks you want:
# require "active_record/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "sprockets/railtie"
# # require "rails/test_unit/railtie"


Bundler.require(:default, Rails.env)

#ActiveRecord::Base.raise_in_transactional_callbacks = true


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.


module Bicicletea
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Enable the asset pipeline
    #config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    #config.assets.version = '1.0'

    # Fonts Path
    config.assets.paths << "#{Rails.root}/app/assets/fonts"

    # Prevent initializing the application before assets are precompiled (required for heroku)
    #config.assets.initialize_on_precompile = false

    # Add js/css from public, private and admin for precompile
    config.assets.precompile += ['public/application.js', 'public/application.css',
    'editors/application.js', 'editors/application.css',
    'super_admin/application.js', 'super_admin/application.css']
  end
end
