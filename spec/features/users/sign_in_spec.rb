require 'rails_helper'

RSpec.feature 'User can sign in: ' do 
  scenario 'and is successful' do 
    user = FactoryGirl.create(:user)
    
    visit sign_in_url
    
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Sign In'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content(user.email)
  end
end