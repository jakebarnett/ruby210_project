require 'rails_helper'

RSpec.feature 'Lists all users: ', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  context 'on users list' do
    before(:all) do
      User.destroy_all
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end
    
    scenario 'displays the users' do 
      visit '/'
      # click_link 'Users'
      
      first(:link, "Users").click
      
      expect(current_url).to eq(users_url)
      expect(page).to have_content('3 users')
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
  end
end