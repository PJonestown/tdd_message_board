require 'rails_helper'

describe 'the posts index', type: :feature do
  let(:post) {FactoryGirl.create(:post)}

  before(:each) do
    visit posts_path
  end

  it 'has a form to create a new post' do
    expect(page).to have_button('Create Post')
  end
end
