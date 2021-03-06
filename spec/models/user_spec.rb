require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user_attr = FactoryGirl.attributes_for(:user)
    @user = FactoryGirl.build(:user)
  end

  it 'should create a new instance of user with valid attributes' do
    @user = User.create!(@user_attr)
  end

  it 'has an array of posts' do
    expect(@user.posts).to eq([])
  end

  it "convert to a string with email" do
    expect(@user.to_s).to eq('user@example.com')
  end

  it "has an array of comments" do
    expect(@user.comments).to eq([])
  end
end
