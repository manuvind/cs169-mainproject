# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
events = Event.create([
  {
    title: 'Feed the homeless',
    description: 'Soup kitchen for the homeless at the church',
    time: DateTime.new(2013,11,5)
  }
])

volunteers = Volunteer.create([
  {
    name: 'John Jingleheimerschmidt',
    email: 'john@bojangles.gov'
  },{
    name: 'The Temptations',
    email: 'my@girl.talkinbout'
  },{
    name: 'Jeff Gordon',
    email: 'hotwheels@nascar.org'
  }
])

Shift.create([
  {
    title: 'Kitchen Coordinator',
    description: 'Should manage the kitchen workers while cooking the food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    event_id: events.first.id
  },{
    title: 'Server',
    description: 'Will serve food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    event_id: events.first.id,
    volunteer_id: volunteers.first.id
  }
])

User.create([
  {
    email: 'abc@abc.org',
    password: '12341234',
    password_confirmation: '12341234'
  }
])