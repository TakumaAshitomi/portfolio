require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.new(
      name:     "testuser",
      email:    "example@mail.com",
      password: "password"
    )
  end
  
  it "is valid with name,email, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    @user.valid?
    expect(@user.errors[:name]).to include("を入力してください")
  end
  
  it "is invalid without a email" do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("を入力してください")
  end
  
  it "is invalid without a password" do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("を入力してください")
  end
  
  it "allows two users registrate with same name" do
    @user.save
    user2=@user.dup
    user2.email="example2@mail.com"
    user2.save
    expect(user2).to be_valid
  end
  
  it "disallows two users ragistrate with same email" do
    @user.save
    user2=@user.dup
    user2.save
    expect(user2).to_not be_valid
  end
end