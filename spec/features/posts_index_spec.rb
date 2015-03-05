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

  #todo
  #use contexts and describes

  it 'redirects user to sign_up page when creating a post w/o log in' do
    page.fill_in('Title', with: 'Great Title')
    page.fill_in('Body', with: 'Nice body!')
    page.click_button('Create Post')

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_link(
      'Sign up',
      href: new_user_registration_path
    )

  end

  it 'Signs up new user and creates new post' do

    visit root_path
    click_link('Sign up')
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
    expect(page).to have_content('test@gmail.com')
  end

end
