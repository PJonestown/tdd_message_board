require 'rails_helper'

describe 'editing a post', type: :feature do
  
  before(:each) do
    visit root_path
    page.click_link('Sign up')
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

    it 'edits a post' do
      click_link('Edit')
      page.fill_in('Title', with: 'A new title')
      page.click_button('Update Post')

      expect(page).not_to have_content('A title')
      expect(page).to have_content('A new title')
    end
  end

  describe 'without ownership' do

    before(:each) do
      click_link('Sign out')
      
      page.click_link('Sign up')
      page.fill_in('Email', with: 'first@gmail.com')
      page.fill_in('Password', with: 'foobarfoo')
      page.fill_in('Password confirmation', with: 'foobarfoo')
      page.click_button('Sign up')
    end

    it 'does not show an edit link' do
      visit root_path
      expect(page).not_to have_link('Edit')
    end

    it 'does not edit post' do
      visit edit_post_path(2)
    end

  end

end
