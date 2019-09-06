# frozen_string_literal: true

50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    user_profile: Faker::Quote.famous_last_words
  )
end
User.create(
  name: "Guest",
  email: "Guest@mail.com",
  password: "password"
)
