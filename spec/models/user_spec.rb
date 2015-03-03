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
end
