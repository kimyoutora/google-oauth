# require "google_oauth/calendar"
require "google_oauth/client"
# require "google_oauth/document"
# require "google_oauth/contacts"
# require "google_oauth/mail"

module GoogleOAuth
  class << self
    attr_accessor :client_id, :client_secret, :scope, :host

    def configure
      yield self
      true
    end

    def client(opts)
      client.new(opts)
    end
  end
end
