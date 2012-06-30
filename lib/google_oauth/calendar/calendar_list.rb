module GoogleOAuth
  module Calendar
    # https://developers.google.com/google-apps/calendar/v3/reference/calendarList
    # Google needs better naming schemes for this stuff. What is calling list on calendar list???

    class CalendarList
      attr_accessor :kind, :etag, :id, :summary, :description, :location,
                    :time_zone, :summary_override, :color_id, :hidden, :selected,
                    :access_role, :default_reminders

      def initialize(opts = {})
        opts.each_pair do |key, value|
          send "#{key}=".to_sym, value
        end
        super
      end
    end
  end
end
