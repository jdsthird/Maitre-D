require 'faker'

Event.destroy_all if Event.any?
Guest.destroy_all if Guest.any?
Pairing.destroy_all if Pairing.any?
# SeatingChartGenerator.destroy_all if SeatingChartGenerator.any?
Table.destroy_all if Table.any?
User.destroy_all if User.any?

user = User.create!(first_name: "Tom Morvolo", last_name: "Riddle", email: "dark.lord@hewhomustnotbenamed.com", username: "iamlordvoldemort", password: "password")
event = Event.create!(name: "Death Eaters Convention", zip_code: "60654", state: "IL", address_line_one: "351 W. Hubbard St.", begins_at: (DateTime.current + 1.month), ends_at: (DateTime.current + 1.month + 3.hours), host: user)

table_number = 1
10.times do
  Table.create!(event: event, number: table_number, number_of_seats: 10)
  table_number += 1
end

91.times do
  Guest.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, event: event)
end

Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)
Pairing.create!(guest: Guest.all.sample, pair: Guest.all.sample)


