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
end
