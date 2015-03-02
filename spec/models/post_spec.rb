require 'rails_helper'

RSpec.describe Post, type: :model do
	before do 
		@post = FactoryGirl.create(:post)
	end

	it "has a valid factory" do 
		expect(@post).to be_valid
	end

  it "is invalid without a title" do
    @post.title = nil
    expect(@post).not_to be_valid
  end

  it "is invalid without a body" do
    @post.body = nil
    expect(@post).not_to be_valid
  end

  it "is invalid if title is over 140 characters" do
    @post.title = 'a'*141
    expect(@post).not_to be_valid
  end

  it "is ivalid if body over 5000 characters" do
    @post.body = 'a' * 5001
    expect(@post).not_to be_valid
  end
  
end
