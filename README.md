# google-oauth

Thin ruby wrapper for the various Google OAuth 2 APIs

## Notice
I created this for use in a school project. It's still very raw and not ready for general public consumptions yet.

## Install
```
gem install google-oauth 
```

## Examples
```ruby
# set up the connection
require 'google_oauth'
GoogleOAuth.configure do |s|
  s.client_id = CLIENT_ID
  s.client_secret = CLIENT_SECRET
  s.scope = 'userinfo.email,userinfo.profile,http://www.google.com/calendar/feeds/,http://www.google.com/m8/feeds/'
  s.host = "http://localhost:3000"
end
user = User.first
oauth = u.authentications.first
# you can manually pass in the tokens here but passing in
# the oauth activerecord object is a convenient shortcut
# This also supports updating of your refresh token
client = GoogleOAuth::Client.new(:authentication => oauth)

# Getting a list of calendars
client.calendar_list

# Getting data from your primary calendar
client.get_calendar
```

## Future work
I hope to rewrite most of this so that there's a much nicer DSL for general consumption with tests and better documentation.

== Contributing to google-oauth

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Kang Chen. See LICENSE.txt for
further details.
