# spec/factories/performers.rb
FactoryBot.define do
    factory :performer do
      id {  }
      email { 'performer@example.com' }
      password_digest { 'password123' }
      contact_number { '0987654321' }
      stage_name { Performer }
      age { 25 }
      gender { 'Male' }
      location { 'New York' }
      description { 'Dance'}
      ratings { '5' }
      availability { 'Available' }
      token { '654zyx321cba'}
      created_at { Time.current }
      updated_at { Time.current }
    end
  end