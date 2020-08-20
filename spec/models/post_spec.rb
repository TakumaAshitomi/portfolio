# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  before do
    @post = build(:post)
  end

  it "has a valid factory" do
    create(:user, id: @post.user_id)
    expect(@post).to be_valid
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
    @post.title = "a" * 16
    @post.valid?
    expect(@post.errors[:title]).to include("は15文字以内で入力してください")
  end

  it "disallow description over 400 characters" do
    @post.description = "a" * 401
    @post.valid?
    expect(@post.errors[:description]).to include("は400文字以内で入力してください")
  end

  context "when there are two posts" do
    before do
      @post2 = build(:post)
    end

    it "allows same user create two posts with different title" do
      create(:user, id: @post2.user_id)
      @post2.user_id = @post.user_id
      @post.save
      @post2.title = "different title"
      @post2.save
      expect(@post2).to be_valid
    end

    it "disallows same user create two posts with different title" do
      @post2.title = @post.title
      expect(@post2).to_not be_valid
    end

    it "alllow two users create posts each same title" do
      @user2 = create(:user)
      @user2.save
      @post2.title = @post.title
      @post2.user_id = @user2.id
      expect(@post2).to be_valid
    end

    it "allow create post with image url" do
      expect(@post.description).to include("content_20070821201759_15.jpg")
    end
  end
end
