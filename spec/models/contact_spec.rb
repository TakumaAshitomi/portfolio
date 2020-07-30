# frozen_string_literal: true

require "rails_helper"

RSpec.describe Contact, type: :model do
  before do
    @contact = build(:contact)
  end

  it "has a valid factory" do
    expect(@contact).to be_valid
  end

  it "is invalid without a name" do
    @contact.name = nil
    @contact.valid?
    expect(@contact.errors[:name]).to include("を入力してください")
  end
end
