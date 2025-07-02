# frozen_string_literal: true

require 'fileutils'

# See https://stackoverflow.com/a/837593/3726759
$LOAD_PATH.unshift(File.join(Dir.pwd, 'app'))

require 'concerns/operating_system_detectable'

class AppUtils
  include OperatingSystemDetectable

  class << self
    def yes?(value)
      return true if [ true, 1 ].include?(value)
      return false if value.nil?

      /^Y(es)?|^T(rue)|^On$/i.match?(value.to_s.strip)
    end

    def send_emails?
      default_value =
        Rails.env.production? || letter_opener_enabled?

      yes?(ENV.fetch('SEND_EMAILS_ENABLED', default_value))
    end

    def use_secure_protocol?
      Rails.env.production? || hostname_is_nginx_proxy?
    end

    def hostname_is_nginx_proxy?
      /\.ngrok\.(dev|app)/.match?(hostname)
    end

    def letter_opener_enabled?
      return false if Rails.env.production?

      yes?(ENV.fetch('LETTER_OPENER_ENABLED', 'yes'))
    end
  end
end
