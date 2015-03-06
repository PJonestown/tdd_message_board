require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'comment' do

    it 'should have a body' do
      @comment = Comment.new(body: nil)
      expect(@comment).not_to be_valid
    end
  end
end
