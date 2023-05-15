# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Loop through each possible value to create random data
50.times do
    Client.create!(
      email: "#{rand(10000)}@example.com",
      password: "password#{rand(10000)}",
      contact_number: "+1-555-#{rand(100..999)}-#{rand(1000..9999)}",
      nick_name: "Client#{rand(10000)}",
      age: rand(18..65),
      gender: ["Male", "Female", "Non-binary"].sample,
      location: "City#{rand(10)}",
      spent_amount: rand(100..1000)
    )
  end
  
  # Create 50 performers
  50.times do
    Performer.create!(
      email: "#{rand(10000)}@example.com",
      password: "password#{rand(10000)}",
      contact_number: "+1-555-#{rand(100..999)}-#{rand(1000..9999)}",
      stage_name: "Performer#{rand(10000)}",
      age: rand(18..65),
      gender: ["Male", "Female", "Non-binary"].sample,
      location: "City#{rand(10)}",
      description: "Description #{rand(10000)}",
      ratings: rand(1..5),
      availability: ["Full-time", "Part-time"].sample
    )
  end