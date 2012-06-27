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

      # Deletes an entry on the user's calendar list.
      def delete_calendar_list(calendar_id)
      end

      # Returns an entry on the user's calendar list.
      def get_calendar_list(calendar_id)
      end

      # Adds an entry to the user's calendar list.
      def insert_calendar_list(opts = {})
      end

      # Returns entries on the user's calendar list.
      def list_calendar_list
        page_token = nil
        result = client.execute(:api_method => service.calendar_list.list)
        entries = []
        while true
          entries += result.data.items
          if !(page_token = result.data.next_page_token)
            break
          end
          result = client.execute(:api_method => service.calendar_list.list,
                                  :parameters => {'pageToken' => page_token})
        end

        entries
      end

      # Updates an entry on the user's calendar list.
      def update_calendar_list(opts = {})
      end

      # Updates an entry on the user's calendar list. This method supports patch semantics
      def patch_calendar_list(opts = {})
        update_calendar_list
      end
    end
  end
end
