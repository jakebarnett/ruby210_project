require 'rails_helper'

RSpec.feature 'When editing a user profile: ', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'updates the user\'s name' do
    user = FactoryGirl.create(:user)
    
    visit user_url(user)
    
    click_link 'Edit User'
    
    expect(current_path).to eq(edit_user_path(user))
    expect(find_field('user_name').value).to eq(user.name)
    expect(find_field('user_email').value).to eq(user.email)
        
    fill_in 'user_name', with: 'New name'
    
    click_button 'Update User'
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('New name')
  end

end