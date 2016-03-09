require 'rails_helper'

RSpec.feature 'While create a new user: ', type: :feature do 
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
    
  end
  it "does not save the user if the password confirmation does not match" do
    visit '/users'
    click_link 'New User'
    
    fill_in 'user_name', with: 'Jake B' 
    fill_in 'user_email', with: 'jake@test.com'
    fill_in 'user_password', with: '1234'
    fill_in 'user_password_confirmation', with: '12345'
    click_button 'Create User'

    click_button 'Create User'
        
    expect(page).to have_text('error')
  end
  
  scenario 'a user can create a new user profile' do 
    visit '/users'
    click_link 'New User' 
    
    expect(current_url).to eq(new_user_url)
    
    fill_in 'user_name', with: 'Jake B' 
    fill_in 'user_email', with: 'jake@test.com'
    fill_in 'user_password', with: '1234'
    fill_in 'user_password_confirmation', with: '1234'
    click_button 'Create User'
    
    expect(page).to have_content('Jake B')
    expect(page).to have_content('jake@test.com')
    expect(page).to have_content('User successfully created.')
  end
  
  
end