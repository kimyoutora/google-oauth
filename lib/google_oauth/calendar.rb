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