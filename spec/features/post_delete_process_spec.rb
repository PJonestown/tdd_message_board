require 'rails_helper'

describe 'deleting a post', type: :feature do

  before(:each) do
    visit new_user_registration_path
    page.fill_in('Email', with: 'first@gmail.com')
    page.fill_in('Password', with: 'foobarfoo')
    page.fill_in('Password confirmation', with: 'foobarfoo')
    page.click_button('Sign up')
    expect(current_path).to eq(root_path)
    page.fill_in('Title', with: 'A title')
    page.fill_in('Body', with:  'A body')
    page.click_button('Create Post')
  end

  describe 'with ownership' do

    it 'should delete the post' do
      visit root_path
      page.click_link('Destroy')


      expect(page).to have_content('Post was successfully destroyed.')


    end

  end
end
