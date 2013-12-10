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
    time: DateTime.new(2014,11,5),
    active: false
  }
])

volunteers = Volunteer.create([
  {
    name: 'John Jingleheimerschmidt',
    email: 'john@bojangles.gov',
    phone: '123-456-7890',
    temp: false
  },{
    name: 'The Temptations',
    email: 'my@girl.talkinbout',
    phone: '098-765-431',
    temp: false
  },{
    name: 'Jeff Gordon',
    email: 'hotwheels@nascar.org',
    phone: '111-111-1111',
    temp: false
  }
])

Rotation.create([
  {
    number: 1,
    event: events.first
  },{
    number: 2,
    event: events.first
  }
])

Shift.create([
  {
    title: 'Kitchen Coordinator',
    description: 'Should manage the kitchen workers while cooking the food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    rotation_id: 1,
    email: 'PLEASE COME TO THIS SHIFT!',
    reminder: DateTime.new(2013,11,4,18)
  },{
    title: 'Server',
    description: 'Will serve food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    rotation_id: 1,
    volunteer_id: volunteers.first.id,
    email: 'PLAZZZZ',
    reminder: DateTime.new(2013,11,4,18)
  },{
    title: 'Kitchen Coordinator',
    description: 'Should manage the kitchen workers while cooking the food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    rotation_id: 2,
    volunteer_id: 2,
    email: 'PLEASE COME TO THIS SHIFT!',
    reminder: DateTime.new(2013,11,4,18)
  },{
    title: 'Server',
    description: 'Will serve food',
    start: DateTime.new(2013,11,5,18,30),
    end: DateTime.new(2013,11,5,19),
    rotation_id: 2,
    volunteer_id: 3,
    email: 'PLAZZZZ',
    reminder: DateTime.new(2013,11,4,18)
  }
])

User.create([
  {
    email: '123@abc.org',
    password: '12341234',
    password_confirmation: '12341234',
    is_admin: true,
    name: 'Mikey Jackson'
  },{
    email: 'foo@test.com',
    password: 'password',
    password_confirmation: 'password',
    is_admin: true,
    name: 'Hello McWorldsen'
  },{
    email: 'manuvind@berkeley.edu',
    password: 'america',
    password_confirmation: 'america',
    is_admin: true,
    name: 'America'
  }
])
