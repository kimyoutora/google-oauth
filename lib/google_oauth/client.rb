module GoogleOAuth
  class Client
    attr_accessor :refresh_token, :client_id, :client_secret

    def initialize(options = {})
      [:refresh_token, :client_id, :client_secret].each do |attr|
        instance_variable_set("@#{attr}".to_sym, options[attr])
      end
    end
  end
end