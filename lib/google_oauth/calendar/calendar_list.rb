module GoogleOAuth
  module Calendar
    # https://developers.google.com/google-apps/calendar/v3/reference/calendarList

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

      # Clears a primary calendar. This operation deletes all data associated with the primary calendar of an account and cannot be undone.
      def self.clear!
      end

      # Deletes a secondary calendar.
      def self.delete!
      end

      # Returns metadata for a calendar
      def self.get(calendar_id = 'primary')
        google_client.execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => "{#{calendar_id}}" })
      end

      # Creates a secondary calendar.
      def insert
      end

      # Updates metadata for a calendar.
      def self.update
      end

      # Updates metadata for a calendar. This method supports patch semantics.
      def self.patch
        update
      end
    end
  end
end
