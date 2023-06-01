# spec/factories/clients.rb
FactoryBot.define do
  factory :client do
    id {  }
    email { 'test@example.com' }
    password_digest { 'password123' }
    contact_number { '1234567890' }
    nick_name { 'TestClient' }
    age { 25 }
    gender { 'Female' }
    location { 'New York' }
    spent_amount { 100.0 }
    token { 'abc123xyz456' }
    created_at { Time.current }
    updated_at { Time.current }
  end
end