# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: Faker::Internet.email,
  password: "123456"
)
puts "#{user} created"
user.save

3.times do
  breed = Breed.new(
    name: Faker::Creature::Dog.breed,
    description: Faker::Creature::Dog.meme_phrase,
    health_issues: rand(1..5),
    activity_level: rand(1..5),
    coats: Faker::Creature::Dog.coat_length,
    family_friendly: rand(1..5),
    trainability: rand(1..5),
    minimum_weight: rand(10..20),
    maximum_weight: rand(27..40),
    minimum_life_span: rand(3..8),
    maximum_life_span: rand(9..13),
    guardian_insticts: rand(1..5),
    grooming_requirements: rand(1..5)
  )
  breed.save!
end

3.times do
  breeder = Breeder.new(
    name: Faker::Name.name,
    city: Faker::Address.city,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    website_url: Faker::Internet.url,
    about_us: ['I love dog', 'Dog is my friend'].sample,
    user_id: user.id
  )
  breeder.save!
end

3.times do
  parent = Parent.new(
    name: Faker::Creature::Dog.name,
    coat: Faker::Creature::Dog.coat_length,
    gender: Faker::Creature::Dog.gender,
    weight: rand(10..40),
    description: Faker::Creature::Dog.meme_phrase,
    breeder_id: Breeder.find(rand(1..3)).id,
    breed_id: Breed.find(rand(1..3)).id
  )
  parent.save!
end

3.times do
  litter = Litter.new(
    name: Faker::Creature::Dog.name,
    birth_date: Faker::Date.birthday(min_age: 0, max_age: 13),
    stud_id: Parent.find(rand(1..3)).id,
    mom_id: Parent.find(rand(1..3)).id,
    breeder_id: Breeder.find(rand(1..3)).id
  )
  litter.save
end

3.times do
  puppy = Puppy.new(
    name: Faker::Creature::Dog.name,
    coat: Faker::Creature::Dog.coat_length,
    gender: Faker::Creature::Dog.gender,
    weight: rand(10..40),
    litter_id: Litter.find(rand(1..3)).id,
    breed_id: Breed.find(rand(1..3)).id
  )
  puppy.save
end
