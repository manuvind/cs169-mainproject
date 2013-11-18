Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here
    Event.create!(event)
  end
end

Given /the following shifts exist/ do |shifts_table|
  #event_id = Event.find_by_title(event_title).id.to_s
  #volunteer_id = Volunteer.find_by_name(volunteer_name).id.to_s
  shifts_table.hashes.each do |shift|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here
    Shift.create!(shift)
  end
end

Given /the following volunteers exist/ do |volunteers_table|
  volunteers_table.hashes.each do |volunteer|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here
    Volunteer.create!(volunteer)
  end
end