require 'rails_helper'

RSpec.feature 'When a user signs out:' do 
  scenario 'a user is redirected to the sign out landing page' do 
    @user = FactoryGirl.create(:user)
    
    sign_in(@user)
    
    click_link 'Sign Out'
    
    expect(current_path).to eq(landing_path)
    expect(page).to have_content('signed out')
  end
end