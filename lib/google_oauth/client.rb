require 'google/api_client'
require 'google_oauth/calendar'

module GoogleOAuth
  class Client
    include Calendar

    attr_accessor :refresh_token, :access_token, :google_client, :expires_at, :authentication

    def initialize(options = {})
      if options[:authentication]
        [:refresh_token, :access_token, :google_client, :expires_at].each do |attr|
          instance_variable_set("@#{attr}".to_sym, options[:authentication].send(attr))
        end
      else
        [:refresh_token, :access_token, :google_client, :expires_at].each do |attr|
          instance_variable_set("@#{attr}".to_sym, options[attr])
        end
      end

      setup_google_client!
    end

    # Delegate to Google OAuth Client
    def method_missing(method, *args, &block)
      google_client.send(method, *args, &block)
    end

    private

    def setup_google_client!
      @google_client = Google::APIClient.new
      @google_client.authorization.client_id      = GoogleOAuth.client_id
      @google_client.authorization.client_secret  = GoogleOAuth.client_secret
      @google_client.authorization.scope          = GoogleOAuth.scope
      @google_client.authorization.refresh_token  = refresh_token
      @google_client.authorization.access_token   = access_token

      # Google OAuth API is a big liar!
      # Their API does not seem to respect the expiration time they specify
      # in their initial response
      if @google_client.authorization.refresh_token && oauth_expired?
        new_tokens = @google_client.authorization.fetch_access_token!

        expires_at = 10.minutes.from_now
        if authentication
          authentication.access_token     = new_tokens["access_token"]
          authentication.oauth_expires_at = 10.minutes.from_now
          authentication.save
        end
      end
    end
    
    def oauth_expired?
      expires_at < Time.now
    end

    def service
      @service ||= google_client.discovered_api('calendar', 'v3')
    end
  end
end