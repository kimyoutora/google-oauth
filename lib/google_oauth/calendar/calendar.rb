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

      # Clears a primary calendar. This operation deletes all data associated with the primary calendar of an account and cannot be undone.
      def clear_calendar
      end

      # Deletes a secondary calendar.
      def delete_calendar(calendar_id)
      end

      # Returns metadata for a calendar
      def get_calendar(calendar_id = 'primary')
        google_client.execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => "{#{calendar_id}}" })
      end

      # Creates a secondary calendar.
      def insert_calendar(opts = {})
      end

      # Updates metadata for a calendar.
      def update_calendar(opts = {})
      end

      # Updates metadata for a calendar. This method supports patch semantics.
      def patch_calendar(opts = {})
        update_calendar(opts)
      end
    end
  end
end