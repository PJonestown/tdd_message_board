require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user_attr = FactoryGirl.attributes_for(:user)
  end

  it 'should create a new instance of user with valid attributes' do
    @user = User.create!(@user_attr)
  end
end
