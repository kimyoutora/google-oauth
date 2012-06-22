module GoogleOAuth
  class << self
    attr_accessor :token, :secret, :refresh_token

    def configure
      yield self
      true
    end
  end

  autoload :Calendar, "./google_oauth/calendar"
  autoload :Client, "./google_oauth/client"
  autoload :Document, "./google_oauth/document"
  autoload :Contancts, "./google_oauth/contacts"
  autoload :Mail, "./google_oauth/mail"
end