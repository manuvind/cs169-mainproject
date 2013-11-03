# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
events = Event.create([
  {
    title: 'Small Group',
    description: 'with Pastor Huang',
    time: DateTime.new(2013,11,5)
  }
])

Shift.create([
  {
    title: 'Worship Team Lead',
    description: 'lead praise songs',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    event_id: events.first.id
  }
])