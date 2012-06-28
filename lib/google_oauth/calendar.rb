require "google_oauth/calendar/acl"
require "google_oauth/calendar/calendar"
require "google_oauth/calendar/calendar_list"
require "google_oauth/calendar/color"
require "google_oauth/calendar/event"
require "google_oauth/calendar/free_busy"
require "google_oauth/calendar/setting"

module GoogleOAuth
  module Calendar
    # Deletes an entry on the user's calendar list.
    def delete_calendar_list(calendar_id)
    end

    # # Returns an entry on the user's calendar list.
    # def get_calendar_list(calendar_id)
    # end

    # Adds an entry to the user's calendar list.
    def insert_calendar_list(opts = {})
    end

    # Returns entries on the user's calendar list.
    # CalendarList#list
    def calendar_list
      page_token = nil
      result = execute(:api_method => service.calendar_list.list)
      entries = []
      while true
        entries += result.data.items
        if !(page_token = result.data.next_page_token)
          break
        end
        result = execute(:api_method => service.calendar_list.list,
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

    # Clears a primary calendar. This operation deletes all data associated with the primary calendar of an account and cannot be undone.
    def clear_calendar
    end

    # Deletes a secondary calendar.
    def delete_calendar(calendar_id)
    end

    # Returns metadata for a calendar
    def get_calendar(calendar_id = 'primary')
      execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => calendar_id })
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