require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name and email" do
    user = User.new(
      name: "example",
      email: "example@mail.com"
      )
    expect(user).to be_valid
  end
end
