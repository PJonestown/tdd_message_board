require 'rails_helper'

describe 'the posts index', type: :feature do

  # post = FactoryGirl.create(:post)

  before(:each) do
    visit posts_path
  end

  #todo
  #probably elete this too and move it over to 
  #a view spec
  it 'has a form to create a new post' do
    expect(page).to have_button('Create Post')
  end



  it 'Signs up new user and creates new post' do
    #todo
    #this should click a button for sign up
    visit new_user_registration_path
    page.fill_in('Email', with: 'test@gmail.com')
    page.fill_in('Password', with: 'mypassword')
    page.fill_in('Password confirmation', with: 'mypassword')
    page.click_button('Sign up')

    page.fill_in('Title', with: 'foobar')
    page.fill_in('Body', with: 'barfoho')
    page.click_button('Create Post')
    
    expect(current_path).to eq(posts_path)
    expect(page).not_to have_content('error')
    expect(page).to have_content('barfoho')
  end

end
