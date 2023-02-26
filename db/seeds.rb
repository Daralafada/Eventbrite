require 'faker'
require "active_support/core_ext/date_and_time/calculations"

User.delete_all
Event.delete_all

20.times do |i|
	User.create(
		email: "chandara"+(rand(0..40).to_s)+"@yopmail.com", 
		password: 'azerty', 
		description: Faker::Lorem.paragraph, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		)
end 

duree = []
duree << 5.step(2000, 5)

10.times do |i|
	Event.create!(
		start_date: DateTime.strptime("22/02/2023 09:00", "%d/%m/%Y %H:%M"), 
		duration: duree.sample.to_s.to_i,
		title: Faker::Lorem.sentence, 
		description: Faker::Lorem.paragraph,
		price: rand(1..1000), 
		location: Faker::Address.city,
		user_id: User.all.sample.id,
		)
end 

20.times do |i|
	Attendance.create!(
		stripe_customer_id: rand(0..50),
		user_id: User.all.sample.id,
		event_id: Event.all.sample.id, 
		)
end 


