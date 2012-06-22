module GoogleOAuth
  class << self
    attr_accessor :token, :secret, :refresh_token

    def configure
      yield self
      true
    end
  end

  autoload :Calendar, "google-oauth/calendar"
  autoload :Client, "google-oauth/client"
  autoload :Document, "google-oauth/document"
  autoload :Contancts, "google-oauth/contacts"
  autoload :Mail, "google-oauth/mail"
end