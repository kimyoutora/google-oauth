require "google_oauth/calendar/acl"
require "google_oauth/calendar/calendar"
require "google_oauth/calendar/calendar_list"
require "google_oauth/calendar/color"
require "google_oauth/calendar/event"
require "google_oauth/calendar/free_busy"
require "google_oauth/calendar/setting"

module GoogleOAuth
  module Calendar
    # Clears a primary calendar. This operation deletes all data associated with the primary calendar of an account and cannot be undone.
    def clear_primary_calendar!
    end

    # Deletes a secondary calendar.
    def delete!
    end

    # Returns metadata for a calendar
    def get(calendar_id = 'primary')
      google_client.execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => "{#{calendar_id}}" })
    end

    # Creates a secondary calendar.
    def insert
    end

    # Updates metadata for a calendar.
    def update
    end

    # Updates metadata for a calendar. This method supports patch semantics.
    def patch
      update
    end
  end
end