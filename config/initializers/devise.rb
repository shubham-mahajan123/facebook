# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise.
  # config.secret_key = 'your_secret_key'

  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # Configure which keys are used when authenticating a user.
  config.authentication_keys = [:email]

  # Configure case-insensitive keys.
  config.case_insensitive_keys = [:email]

  # Configure whitespace stripping.
  config.strip_whitespace_keys = [:email]

  # Skip session storage for certain strategies.
  config.skip_session_storage = [:http_auth]

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12

  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :recoverable
  config.reset_password_within = 6.hours

  # ==> Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.unlock_strategy = :email
  config.maximum_attempts = 20
  config.unlock_in = 1.hour
  config.last_attempt_warning = true

  # ==> OmniAuth
  config.omniauth :google_oauth2, '672543062327-bnv2oje7rjb6n76cf24mcep9r916quli.apps.googleusercontent.com', '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'

  # ==> Navigation configuration
  config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.sign_out_via = :delete

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  # Add other configurations as needed
end
