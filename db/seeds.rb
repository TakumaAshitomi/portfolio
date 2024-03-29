# frozen_string_literal: true

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "passWo!rd21",
    user_profile: Faker::Quote.famous_last_words
  )
end
User.create(
  name: "Guest",
  email: "Guest@mail.com",
  password: "passWo!rd21",
  confirmed_at: Time.now
)
