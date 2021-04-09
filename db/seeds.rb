# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Starting seed"

puts "Creating user"
3.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456"
    )
  puts "#{user} created"
  user.save
end

def dog
  url = 'https://api.thedogapi.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&page=0&limit=1'
  dog_serialized = open(url).read
  return dog = JSON.parse(dog_serialized)
  # All the information needed as follow
  # dog_name = dog[0]["breeds"][0]["name"]
  # dog_image = dog[0]["url"]
end

def dog_description_breed
  url = 'https://api.thedogapi.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&page=0&limit=1'
  dog_serialized = open(url).read
  return dog_description = "This breed is #{dog[0]["breeds"][0]["bred_for"]}, #{dog[0]["breeds"][0]["breed_group"]}, #{dog[0]["breeds"][0]["temperament"]}"
end

def dog_description
  url = 'https://api.thedogapi.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&page=0&limit=1'
  dog_serialized = open(url).read
  return dog_description = "This dog is #{dog[0]["breeds"][0]["bred_for"]}, #{dog[0]["breeds"][0]["breed_group"]}, #{dog[0]["breeds"][0]["temperament"]}"
end

9.times do
  breed = Breed.new(
    name: dog[0]["breeds"][0]["name"],
    description: dog_description_breed,
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
    grooming_requirements: rand(1..5),
    origin: Faker::Address.country
    )
  breed.save!
  file = URI.open(dog[0]["url"])
  breed.photo.attach(io: file, filename: 'breed_pic.jpg', content_type: 'image/jpg')
  breed.save!
  puts "Created breed #{breed.name}"
end

3.times do
  breeder = Breeder.new(
    name: Faker::Name.name,
    city: Faker::Address.city,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    website_url: Faker::Internet.url,
    about_us: ['I am informative and honest about a breed’s physical and
      temperamental traits. And I can speak knowledgeably about genetic diseases
      that might affect my breed.', 'I am friendly and willing
      to establish a good rapport with you. I am an excellent
      resource and breed mentor for you throughout the life of your puppy, and
      encourage you to call if your dog has a crisis at any stage of its life.',
      'I am willing to answer any questions you have, and I will
      ask many of you as well. I want to make sure my puppies are going
      to good homes, with people who know what to expect and have made all the necessary
      preparations.', 'I confirm that my puppies are getting the proper
      nutrition and are protected from the elements. Their whelping box is designed to protect
      them in their early life from drafts or from being accidentally crushed by their mother.',
      'I have a lot of expenses through veterinary checks, shots, and any other health care expenses
      that come up. I am trying to keep meticulous records of my puppies height, weight, and the
      development in their bodies.', 'I will greet you in my house and not somewhere else.
      My puppies live in the house and be handled often, as pet who is born into family life has a
      better shot at growing up relaxed and friendly.' 'Hello, The parents are be on site, and you will be able
      to meet them, meeting the father may not be possible, but you should certainly meet the mother.',
      'My place is clean and safe, and supplied with fresh water, beds, and toys. There is a toilet area
      in the puppy living quarters for housetraining. There will be minimal numbers of litters from mom,
      and the number of litters available for adoption will be limited.', 'I will show knowledge of the
      breed, and be honest about its advantages and drawbacks, whether that means a tendency to develop
      certain health problems or a temperament. I will take the dog back if you are unable to care for it.'].sample,
    user_id: User.find(rand(1..User.ids.length)).id
    )

  file = File.open("app/assets/images/breeder_pic.jpg")
  breeder.photo.attach(io: file, filename: 'breeder_pic.jpg', content_type: 'image/jpg')
  breeder.save!
  puts "Created breeder #{breeder.name}"

  2.times do
    parent = Parent.new(
      name: Faker::Creature::Dog.name,
      coat: Faker::Creature::Dog.coat_length,
      gender: Faker::Creature::Dog.gender,
      weight: rand(10..40),
      description: dog_description,
      breeder_id: Breeder.find(rand(1..Breeder.ids.length)).id,
      breed_id: Breed.find(rand(1..Breed.ids.length)).id
      )
    file = URI.open(dog[0]["url"])
    parent.photo.attach(io: file, filename: 'dalmatian_adult.jpg', content_type: 'image/jpg')
    parent.save!
    puts "Created parent #{parent.name}"

    1.times do
      litter = Litter.new(
        name: Faker::Creature::Dog.name,
        birth_date: Faker::Date.birthday(min_age: 0, max_age: 13),
        stud_id: Parent.find(rand(1..Parent.ids.length)).id,
        mom_id: Parent.find(rand(1..Parent.ids.length)).id,
        breeder_id: Breeder.find(rand(1..Breeder.ids.length)).id
        )
      file = File.open("app/assets/images/litter_pic.jpg")
      litter.photo.attach(io: file, filename: 'litter_pic.jpg', content_type: 'image/jpg')
      litter.save!
      puts "Created litter #{litter.name}"

      2.times do
        puppy = Puppy.new(
          name: Faker::Creature::Dog.name,
          coat: Faker::Creature::Dog.coat_length,
          gender: Faker::Creature::Dog.gender,
          weight: rand(10..40),
          litter_id: Litter.find(rand(1..Litter.ids.length)).id,
          breed_id: Breed.find(rand(1..Breed.ids.length)).id
          )
        file = URI.open(dog[0]["url"])
        puppy.photo.attach(io: file, filename: 'Breed_bulldog.jpg', content_type: 'image/jpg')
        puppy.save!
        puts "Created puppy #{puppy.name}"
      end
    end
  end
end
