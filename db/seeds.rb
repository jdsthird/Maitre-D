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




u1 = User.create(first_name: "Bruce", last_name: "Wayne",
				email: "darkKnigt@gothem.com", username: "batman", password: "joker")

ev = Event.create!(name: "Arkam Reunion", zip_code: "60654", state: "IL", address_line_one: "351 W. Hubbard St.", begins_at: (DateTime.current + 1.month), ends_at: (DateTime.current + 1.month + 3.hours), host: u1)

table_number = 1
8.times do
  Table.create!(event: ev, number: table_number, number_of_seats: 8)
  table_number += 1
end

60.times do
  Guest.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, event: ev)
end

the_gang = []
ev.guests.each do |baddie|
	the_gang << baddie
end

20.times do
	Pairing.create!(guest: the_gang.pop, pair: the_gang.pop)
end



#------------------ For Presentation ----------------------------

user = User.create!(first_name: "The", last_name: "Maitre'D", email: "maitre@d.com", username: "Maitre'D", password: "moustache")
event = Event.create!(name: "DBC Graduation", zip_code: "60654", state: "IL", address_line_one: "351 W. Hubbard St.", begins_at: (DateTime.current), ends_at: (DateTime.current + 3.hours), host: user)

guests = [
  Guest.create!(first_name: "John", last_name: "Sternberg", event: event)
  Guest.create!(first_name: "Kilima", last_name: "Glenn", event: event)
Guest.create!(first_name: "Edwin", last_name: "Steinmetz", event: event)
Guest.create!(first_name: "'Tine'", last_name: "Onayemi", event: event)
Guest.create!(first_name: "Ben", last_name: "DiPaola", event: event)
Guest.create!(first_name: "Brian", last_name: "Fu", event: event)
Guest.create!(first_name: "Christine", last_name: "Hager", event: event)
Guest.create!(first_name: "Evangeline", last_name: "Garreau", event: event)
Guest.create!(first_name: "Lesley", last_name: "Kompare", event: event)
Guest.create!(first_name: "Mari", last_name: "Galicer", event: event)
Guest.create!(first_name: "Mark Donald", last_name: "Amobi", event: event)
Guest.create!(first_name: "Mike", last_name: "Ramuta", event: event)
Guest.create!(first_name: "Nic", last_name: "Stelter", event: event)
Guest.create!(first_name: "Pete", last_name: "Hinners", event: event)
Guest.create!(first_name: "Ryan", last_name: "Lau", event: event)
Guest.create!(first_name: "Shawn", last_name: "Wilkenson", event: event)
Guest.create!(first_name: "Tariq", last_name: "Ali", event: event)
Guest.create!(first_name: "Duke", last_name: "Greene", event: event)
Guest.create!(first_name: "Mike", last_name: "Bikes", event: event)
Guest.create!(first_name: "Maurice", last_name: "Rabb", event: event)
Guest.create!(first_name: "Fluffy", last_name: "Space Cat", event: event)
Guest.create!(first_name: "Furry", last_name: "Space Cat", event: event)
Guest.create!(first_name: "Fuzzy", last_name: "Space Cat", event: event)
Guest.create!(first_name: "Whiskers", last_name: "Space Cat", event: event)
Guest.create!(first_name: "Spot", last_name: "Space Cat", event: event)
Guest.create!(first_name: "Bugs", last_name: "Bunny", event: event)
Guest.create!(first_name: "Elmer", last_name: "Fudd", event: event)
Guest.create!(first_name: "Daffy", last_name: "Duck", event: event)
Guest.create!(first_name: "Porky", last_name: "Pig", event: event)
Guest.create!(first_name: "Yosemite", last_name: "Sam", event: event)
Guest.create!(first_name: "Road", last_name: "Runner", event: event)
Guest.create!(first_name: "Wile E.", last_name: "Coyote", event: event)
Guest.create!(first_name: "Pepe", last_name: "Le Pew", event: event)
Guest.create!(first_name: "Barack", last_name: "Obama", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Secret", last_name: "Service", event: event)
Guest.create!(first_name: "Chilly", last_name: "Willy", event: event)
Guest.create!(first_name: "Happy", last_name: "Feet", event: event)
Guest.create!(first_name: "Skipper", last_name: "", event: event)
Guest.create!(first_name: "Kowalski", last_name: "", event: event)
Guest.create!(first_name: "Rico", last_name: "", event: event)
Guest.create!(first_name: "Private", last_name: "", event: event)
Guest.create!(first_name: "Gunther", last_name: "", event: event)
Guest.create!(first_name: "Alien", last_name: "Xenomorph", event: event)
Guest.create!(first_name: "The", last_name: "Predator", event: event)
Guest.create!(first_name: "Agent J", last_name: "Agent K", event: event)
Guest.create!(first_name: "Frank", last_name: "The Pug", event: event)
Guest.create!(first_name: "Ripley", last_name: "", event: event)
Guest.create!(first_name: "Julius", last_name: "Caesar", event: event)
Guest.create!(first_name: "Brutus", last_name: "", event: event)
Guest.create!(first_name: "Cassius", last_name: "", event: event)
Guest.create!(first_name: "Casca", last_name: "", event: event)
Guest.create!(first_name: "Decius", last_name: "Brutus", event: event)
Guest.create!(first_name: "Metellus", last_name: "Cimber", event: event)
Guest.create!(first_name: "Trebonius", last_name: "", event: event)
Guest.create!(first_name: "Anthony", last_name: "", event: event)
Guest.create!(first_name: "Lepidus", last_name: "", event: event)
Guest.create!(first_name: "Popilius", last_name: "", event: event)
Guest.create!(first_name: "Publius", last_name: "", event: event)
Guest.create!(first_name: "Wolverine", last_name: "", event: event)
Guest.create!(first_name: "Storm", last_name: "", event: event)
Guest.create!(first_name: "Cyclops", last_name: "", event: event)
Guest.create!(first_name: "Professor", last_name: "X", event: event)
Guest.create!(first_name: "Magneto", last_name: "", event: event)
Guest.create!(first_name: "Mr.", last_name: "Rodgers", event: event)
Guest.create!(first_name: "Mr.", last_name: "T", event: event)
Guest.create!(first_name: "Mr.", last_name: "Ed", event: event)
Guest.create!(first_name: "Mr.", last_name: "Belvidere", event: event)
Guest.create!(first_name: "Han", last_name: "Solo", event: event)
Guest.create!(first_name: "Luke", last_name: "Skywalker", event: event)
Guest.create!(first_name: "Leia", last_name: "Organa", event: event)
Guest.create!(first_name: "Chewbacca", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Obi-Wan", last_name: "Kenobi", event: event)
Guest.create!(first_name: "Rosie", last_name: "", event: event)
Guest.create!(first_name: "HAL", last_name: "", event: event)
Guest.create!(first_name: "R2D2", last_name: "", event: event)
Guest.create!(first_name: "C-3PO", last_name: "", event: event)
Guest.create!(first_name: "Deep", last_name: "Blue", event: event)
Guest.create!(first_name: "Bender", last_name: "", event: event)
Guest.create!(first_name: "Number", last_name: "5", event: event)
Guest.create!(first_name: "7", last_name: "of 9", event: event)
Guest.create!(first_name: "Finn", last_name: "The Human", event: event)
Guest.create!(first_name: "Jake", last_name: "The Dog", event: event)
Guest.create!(first_name: "BeMo", last_name: "", event: event)
Guest.create!(first_name: "Princess", last_name: "Bubblegum", event: event)
Guest.create!(first_name: "Marceline", last_name: "The Vampire Queen", event: event)
Guest.create!(first_name: "Lumpy", last_name: "Space Princess", event: event)
Guest.create!(first_name: "Ice", last_name: "King", event: event)
Guest.create!(first_name: "Lady", last_name: "Rainicorn", event: event)
Guest.create!(first_name: "Fiona", last_name: "", event: event)
Guest.create!(first_name: "Cake", last_name: "", event: event)
Guest.create!(first_name: "James", last_name: "Kirk", event: event)
Guest.create!(first_name: "Spock", last_name: "", event: event)
Guest.create!(first_name: "Bones", last_name: "McCoy", event: event)
Guest.create!(first_name: "Nyota", last_name: "Uhura", event: event)
Guest.create!(first_name: "Pavel", last_name: "Checkov", event: event)
Guest.create!(first_name: "Hikaru", last_name: "Sulu", event: event)
Guest.create!(first_name: "Jean Luc", last_name: "Picard", event: event)
Guest.create!(first_name: "William", last_name: "Riker", event: event)
Guest.create!(first_name: "Data", last_name: "", event: event)
Guest.create!(first_name: "Geordi", last_name: "La Forge", event: event)
Guest.create!(first_name: "Beverly", last_name: "Crusher", event: event)
Guest.create!(first_name: "Whorf", last_name: "", event: event)
Guest.create!(first_name: "The", last_name: "Dude", event: event)
Guest.create!(first_name: "Walter", last_name: "Sobchak", event: event)
Guest.create!(first_name: "Donny", last_name: "Kerabatsos", event: event)
Guest.create!(first_name: "Maude", last_name: "Lebowski", event: event)
Guest.create!(first_name: "Nihlist", last_name: "1", event: event)
Guest.create!(first_name: "Nihlist", last_name: "2", event: event)
Guest.create!(first_name: "Taylor", last_name: "Swift", event: event)
Guest.create!(first_name: "John", last_name: "Mayer", event: event)
Guest.create!(first_name: "Brandon", last_name: "Borello", event: event)
Guest.create!(first_name: "Sam", last_name: "Armstrong", event: event)
Guest.create!(first_name: "Joe", last_name: "Jonas", event: event)
Guest.create!(first_name: "Taylor", last_name: "Lautner", event: event)
Guest.create!(first_name: "Jake", last_name: "Gyllenhaal", event: event)
Guest.create!(first_name: "Scott", last_name: "Pilgrim", event: event)
Guest.create!(first_name: "Ramona", last_name: "Flowers", event: event)
Guest.create!(first_name: "Knives", last_name: "Chau", event: event)
Guest.create!(first_name: "Envy", last_name: "Adams", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)
Guest.create!(first_name: "Yoda", last_name: "", event: event)

]

guests.length.times do |i|
  Table.create!(event: event, number: i, number_of_seats: 10)
end