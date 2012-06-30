module GoogleOAuth
  module Calendar
    # https://developers.google.com/google-apps/calendar/v3/reference/calendars

    class Calendar
      attr_accessor :etag, :time_zone, :color_id, :id, :access_role, :summary, :description

      def initialize(opts = {})
        opts.each_pair do |key, value|
          send "#{key}=".to_sym, value
        end
        super
      end
    end
  end
end
