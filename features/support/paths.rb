# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the login page/
      '/users/sign_in'

    when /the edit shift page for "(.*)" of the event "(.*)"/
      shift_title = $1
      event_title = $2
      shift_id = Shift.find_by_title(shift_title).id.to_s
      event_id = Event.find_by_title(event_title).id.to_s
      '/events/' + event_id + '/shifts/' + shift_id + '/edit'

    when /the shifts page for "(.*)"/
      event_title = $1
      event_id = Event.find_by_title(event_title).id.to_s
      '/events/' + event_id + '/shifts'

    when /the events page/
      events_path

    when /the event creation page/
      '/events/new'

    when /the event page for (.*)/
      title = $1
      id = Event.find_by_title(title).id.to_s
      '/events/' + id

    when /the shifts page for (.*)/
      title = $1
      id = Event.find_by_title(title).id
      event_shifts_path(id)

    when /the new shift page for (.*)/
      title = $1
      id = Event.find_by_title(title).id
      new_event_shift_path(id)  

    when /the edit event page for (.*)/
      title = $1
      id = Event.find_by_title(title).id
      edit_event_path(id)    

    when /the volunteers page/
      volunteers_path

    when /the new volunteer page/
      new_volunteer_path

    when /the edit volunteer page for (.*)/
      name = $1
      id = Volunteer.find_by_name(name).id
      edit_volunteer_path(id)

    when /the show volunteer page for (.*)/
      name = $1
      id = Volunteer.find_by_name(name).id
      volunteer_path(id)

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end

  end
end

World(NavigationHelpers)
