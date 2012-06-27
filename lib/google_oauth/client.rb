require 'google/api_client'
require 'google_oauth/calendar'

module GoogleOAuth
  class Client
    include Calendar

    attr_accessor :refresh_token, :access_token, :google_client

    def initialize(options = {})
      [:refresh_token, :access_token, :google_client].each do |attr|
        instance_variable_set("@#{attr}".to_sym, options[attr])
      end

      setup_google_client!
    end

    private

    def setup_google_client!
      google_client = Google::APIClient.new
      google_client.authorization.client_id      = GoogleOAuth.client_id
      google_client.authorization.client_secret  = GoogleOAuth.client_secret
      google_client.authorization.scope          = GoogleOAuth.scope
      google_client.authorization.refresh_token  = refresh_token
      google_client.authorization.access_token   = access_token

      # user = opts[:user]

      # # Google OAuth API is a big liar!
      # # Their API does not seem to respect the expiration time they specify
      # # in their initial response
      # if client.authorization.refresh_token && user.oauth_token_expired?
      #   new_tokens = client.authorization.fetch_access_token!
      #   if opts[:user]
      #     user.access_token     = new_tokens["access_token"]
      #     user.oauth_expires_at = 10.minutes.from_now
      #   end
      # end

      # @client = client
    end
    
    # def self.new_from_user(user)
    #   new({ :access_token => user.access_token, :refresh_token => user.refresh_token, :user => user })
    # end

    # def expired?
    #   @client.expired?

    # def service
    #   @service ||= google_client.discovered_api('calendar', 'v3')
    # end
  end
end