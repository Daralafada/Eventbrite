User.delete_all
Event.delete_all

40 times do 
	User.create!(
		email: Faker::Lorem.word+"@yopmail.com", 
		password: 'azerty', 
		description: Faker::Lorem.paragraph, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		)
end 

10 times do 
	Event.create!(
		start_date: rand(2.years).from_now, 
		duration: rand(5.step(2000, 5),
		title: Faker::Lorem.word, 
		description: Faker::Lorem.paragraph,
		price: rand(1..1000), 
		location: Faker::Address.city,
		)
	end 

50 times do 
	Attendance.create!(
		stripe_customer_id: rand(0..50),
		user_id: User.all.sample.id,
		event_id: Event.all.sample.id, 
		)


