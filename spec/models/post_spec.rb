require 'rails_helper'

RSpec.describe Post, type: :model do
  
  before do
    @user = build(:user)
    @post = build(:post)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  
  it "is invalid without a title" do
    @post.title = nil
    @post.valid?
    expect(@post.errors[:title]).to include("を入力してください")
  end  
  
  it "is invalid without a description" do
    @post.description = nil
    @post.valid?
    expect(@post.errors[:description]).to include("を入力してください")
  end 
  
  it "disallow title over 15 characters" do
    @post.title = ("a")*16
    @post.valid?
    expect(@post.errors[:title]).to include("は15文字以内で入力してください")
  end
  
  it "disallow description over 400 characters" do
    @post.description = ("a")*401
    @post.valid?
    expect(@post.errors[:description]).to include("は400文字以内で入力してください")
  end

  context "when there are two posts" do
    
    before do 
      @post2 = build(:post)
      @user.save
    end
      
    it "allows same user create two posts with different title" do
      expect(@post2).to be_valid
    end
    
    it "disallows same user create two posts with different title" do
      @post2.title = @post.title
      expect(@post2).to be_valid
    end
    
    it "alllow two users create posts each same title" do
      expect(@post2).to be_valid
    end
  end
     

end
