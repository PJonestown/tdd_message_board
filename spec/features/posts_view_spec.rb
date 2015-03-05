require 'rails_helper'

describe 'the root view', type: :feature do

  before(:each) do
    visit root_path
  end

  describe 'when not logged in' do
    it 'has the correct links' do
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
      expect(page).not_to have_link('Sign out')
    end

  end

  describe 'when logged in' do

    before(:each) do
      click_link('Sign up')
      page.fill_in('Email', with: 'yes@gmail.com')
      page.fill_in('Password', with: 'foobarfoo')
      page.fill_in('Password confirmation', with: 'foobarfoo')
      page.click_button('Sign up')
    end

    it 'shows the correct links' do
      expect(page).to have_link('Sign out')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
