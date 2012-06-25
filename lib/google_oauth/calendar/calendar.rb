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
      def self.clear!
        
      end

      # Deletes a secondary calendar.
      def self.delete!
        
      end

      # Returns metadata for a calendar
      def self.get(calendar_id = 'primary')
        client.execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => "{#{calendar_id}}" })
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