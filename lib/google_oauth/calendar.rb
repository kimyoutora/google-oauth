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
    def calendars
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
      execute(:api_method => service.calendars.get, :parameters => { 'calendarId' => calendar_id }).data
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

    def events(calendar_id = 'primary', options = {})
      %w(timeMin timeMax).each do |time|
        options[time] = options[time].xmlschema if options[time]
      end

      params = { 'calendarId' => calendar_id }
      params.merge!(options)
      result = execute(:api_method => service.events.list,
                       :parameters => params)
      events = []
      while true
        events += result.data.items
        if !(params[:page_token] = result.data.next_page_token)
          break
        end
        result = execute(:api_method => service.events.list,
                         :parameters => params)
      end

      events
    end

    # Deletes an event.
    def delete_event(calendar_id = 'primary', event_id)
      execute(:api_method => service.events.delete,
              :parameters => {'calendarId' => calendar_id, 'eventId' => event_id})
    end

    # Returns an event.
    def get_event(calendar_id = 'primary', event_id)
      execute(:api_method => service.events.get,
              :parameters => {'calendarId' => calendar_id, 'eventId' => event_id})
    end

    # Imports an event.
    def import_event
    end

    # Creates an event.
    # event = {
    #   'summary' => 'Appointment',
    #   'location' => 'Somewhere',
    #   'start' => {
    #     'dateTime' => '2011-06-03T10:00:00.000-07:00'
    #   },
    #   'end' => {
    #     'dateTime' => '2011-06-03T10:25:00.000-07:00'
    #   },
    #   'attendees' => [
    #     {
    #       'email' => 'attendeeEmail'
    #     },
    #     #...
    #   ]
    # }
    def insert_event(calendar_id = 'primary', event_hash)
      convert_event_hash_timestamps!(event_hash)
      event = execute(:api_method => service.events.insert,
                      :parameters => {'calendarId' => calendar_id},
                      :body => [JSON.dump(event_hash)],
                      :headers => {'Content-Type' => 'application/json'})
      event ? event.data : nil
    end

    # Returns instances of the specified recurring event.
    def event_instances(calendar_id, event_id)
    end

    # Moves an event to another calendar, i.e. changes an event's organizer.
    def move_event(from_calendar_id = 'primary', to_calendar_id, event_id)
      execute(:api_method => service.events.move,
              :parameters => {'calendarId' => from_calendar_id, 'eventId' => event_id,
                              'destination' => to_calendar_id})
    end

    # Creates an event based on a simple text string.
    def quick_add_event(calendar_id = 'primary', text)
      event = execute(:api_method => service.events.quick_add,
                      :parameters => {'calendarId' => calendar_id,
                                      'text' => text})
      event ? event.data : nil
    end

    # Updates an event.
    def update_event(calendar_id = 'primary', event_id, event_hash)
      convert_event_hash_timestamps!(event_hash)
      event = execute(:api_method => service.events.update,
                      :parameters => {'calendarId' => calendar_id},
                      :body => [JSON.dump(event_hash)],
                      :headers => {'Content-Type' => 'application/json'})
      event ? event.data : nil
    end

    # Updates an event. This method supports patch semantics.
    alias_method :patch_event, :update_event

    private

    def convert_event_hash_timestamps!(event_hash)
      event_hash['start']['dateTime'] = event_hash['start']['dateTime'].xmlschema if event_hash['start'] && event_hash['start']['dateTime']
      event_hash['end']['dateTime'] = event_hash['end']['dateTime'].xmlschema if event_hash['end'] && event_hash['end']['dateTime']
      event_hash
    end
  end
end
