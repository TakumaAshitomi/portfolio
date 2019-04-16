require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name,email, password" do
    user = User.new(
      name:     "testuser",
      email:    "example@mail.com",
      password: "password"
    )
    expect(user).to be_valid
end
  

end