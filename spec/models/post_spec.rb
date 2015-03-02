require 'rails_helper'

RSpec.describe Post, type: :model do
	before do 
		@post = FactoryGirl.create(:post)
	end

	it "has a valid factory" do 
		expect(@post).to be_valid
	end
  
end
