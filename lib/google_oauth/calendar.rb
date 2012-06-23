require "google_oauth/calendar/acl"
require "google_oauth/calendar/calendar"
require "google_oauth/calendar/color"
require "google_oauth/calendar/event"
require "google_oauth/calendar/free_busy"
require "google_oauth/calendar/setting"

module GoogleOAuth
  module Calendar

    def return_sample_calendars
      Acl.new
    end
  end
end