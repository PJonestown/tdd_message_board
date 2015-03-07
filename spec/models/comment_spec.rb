require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'comment' do

    before do
      #@comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user)
      @comment = user.comments.create(
        body: "This is my hacky comment",
        commentable_type: "Post"
      )
    end

    it 'should be valid' do
      expect(@comment).to be_valid
    end

    it 'should have a body' do
      @comment.body = nil
      expect(@comment).not_to be_valid
    end

    it 'should have a commentable_type' do
      @comment.commentable_type = nil
      expect(@comment).not_to be_valid
    end

    it 'should belong to a user' do
      @comment.user = nil
      expect(@comment).not_to be_valid
    end
  end
end
