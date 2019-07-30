require 'rails_helper'

RSpec.describe Subscription, type: :model do
  
  before do
    user = create(:user)
    @subs = build(:subscription, user_id: user.id)
  end
  
  it "is invalid without a user_id" do
    @subs.user_id = nil
    expect(@subs).to_not be_valid
  end

  it "is invalid without a followed_id" do
    @subs.followed_id = nil
    expect(@subs).to_not be_valid
  end
  
  it "is valid normal number" do
    expect(@subs).to be_valid
  end

  context "user has two subs" do
    
    before do 
      @subs2 = build(:subscription, user_id: @subs.user_id)
    end
    
    it "disallow same subs" do
      @subs2.followed_id = @subs.followed_id
      @subs.save
      @subs2.save
      expect(@subs2).to_not be_valid
    end 
    
    it "allow another followed_id" do
      expect(@subs2).to be_valid
    end
  end
end
