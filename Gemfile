source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.2'
# Autoload dotenv in Rails https://github.com/bkeepers/dotenv
# IMPORTANT: This should be loaded as early as possible
gem 'dotenv', groups: %i[development test], require: 'dotenv/load'

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

gem 'vite_rails', '~> 3.0'
gem 'inertia_rails' # For when we just have to have React
gem 'csv', '~> 3.3'
gem 'simple_form', '~> 5.3'
gem 'rails_semantic_logger', '~> 4.17'
gem 'data_migrate', '~> 11.3'
gem 'discard', '~> 1.4'
gem 'faraday'
gem 'friendly_id', '~> 5.5'
gem 'globalid', '~> 1.2'
gem 'interactor', '~> 3.1'
gem 'money-rails', '~> 1.15'
gem 'name_of_person', '~> 1.1'
# gem 'paper_trail', '~> 16'
gem 'phonelib', '~> 0.10'
# gem 'pundit', '~> 2.5'
# gem 'devise', '~> 4.9'
# gem 'omniauth', '~> 2.1'
# gem 'omniauth-google-oauth2', '~> 1.1'
# gem 'devise-passwordless', '~> 1.0'
# gem 'ransack', '~> 4.3'

# See https://youtrack.jetbrains.com/issue/RUBY-32741/Ruby-Debugger-uninitialized-constant-ClassDebaseValueStringBuilder...#focus=Comments-27-9677540.0-0
# gem 'ostruct'

# gem 'flipper-active_record', '~> 1.3'
# gem 'flipper-api'
# gem 'flipper-ui'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false

  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 8.0'
  gem 'rswag-specs'
  gem 'strong_migrations'
  gem 'climate_control'
  gem 'faker'
  gem 'open3'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  gem 'annotaterb'
  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rubocop-capybara', require: false
  gem 'shoulda-matchers', '~> 6.5'
  gem 'vcr', '~> 6.2'
end

