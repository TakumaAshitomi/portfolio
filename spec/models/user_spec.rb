require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email, password" do
    user = User.new(
      email:    "example@mail.com",
      password: "password"
    )
    expect(user).to be_valid
end
  
  xit "can't login with not confirmable user" do
    user = User.new(
      email: "example@mail.com",
      password: "password"
      )
  end
end