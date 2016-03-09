require 'rails_helper'

RSpec.feature "User can delete a project" do
    before(:all) do
        @user = FactoryGirl.create(:user)
        sign_in(@user)
        
        Project.destroy_all
        @project1 = FactoryGirl.create(:project)
    end
    
    scenario "a user clicks the delete project link" do
        visit "/projects"
        click_link "Project #{@project1.name} Info"
        click_link "Delete"
        
        expect(current_path).to eq(projects_path)
        expect(page).to have_content('0 projects')
    end
end