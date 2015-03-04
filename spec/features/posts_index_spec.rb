require 'rails_helper'

describe 'the posts index', type: :feature do

  post = FactoryGirl.create(:post)

  before(:each) do
    visit posts_path
  end

  it 'has a form to create a new post' do
    expect(page).to have_button('Create Post')
  end



  it 'creates a new post' do
    page.fill_in('Title', with: 'foobar')
    page.fill_in('Body', with: 'barfoho')
    page.click_button('Create Post')
    expect(page).not_to have_content('error')
    expect(page).to have_content('barfoho')
  end

  it 'sends user to post page when title is clicked' do
    expect(page).to have_link(post.title, href: post_path(post))

  end

  xit 'lists shows the user who created the post' do
    expect(page).to have_content(post.user)
  end
end
