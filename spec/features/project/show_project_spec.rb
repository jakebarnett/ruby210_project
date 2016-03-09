require "rails_helper"

RSpec.feature "shows a single project" do
    before(:all) do
        @user = FactoryGirl.create(:user)
        sign_in(@user)
        
        Project.destroy_all
        @project1 = FactoryGirl.create(:project)
    end
    
    scenario "it displays the info for a project" do
        visit '/projects'
        
        click_link "Project #{@project1.name} Info"
        
        expect(page).to have_content(@project1.name)
        expect(page).to have_content(@project1.description)
    end
end