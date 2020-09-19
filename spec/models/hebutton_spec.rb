# frozen_string_literal: true

require "rails_helper"

RSpec.describe Hebutton, type: :model do
  before do
    user = create(:user)
    post = create(:post, user_id: user.id)
    @he = create(:hebutton, user_id: user.id, post_id: post.id)
  end

  it "has a valid factory" do
    expect(@he).to be_valid
  end

  it "is correctly validated" do
    he2 = build(:hebutton, user_id: @he.user_id, post_id: @he.post_id)
    expect(he2).to_not be_valid
  end

  it "other users can create he for the same post." do
    user = create(:user)
    he2 = build(:hebutton, user_id: user.id, post_id: @he.post_id)
    expect(he2).to be_valid
  end

  it "will be deleted with the user and post" do
    user = create(:user)
    post = create(:post, user_id: user.id)
    he2 = create(:hebutton, user_id: user.id, post_id: post.id)
    expect(Hebutton.find_by(id: he2.id)).to_not be nil
    user.destroy
    expect(Hebutton.find_by(id: he2.id)).to be nil
  end
end
