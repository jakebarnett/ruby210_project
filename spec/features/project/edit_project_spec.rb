require 'rails_helper'

RSpec.feature "User can edit a project's details" do
    before(:all) do
        Project.destroy_all
        @project1 = FactoryGirl.create(:project)
    end
    
    scenario "a user clicks edit, changes details, and saves" do
        visit "/projects"
        click_link "Project #{@project1.name} Info"
        click_link "Edit Project"
        
        fill_in "project_name",         with: "Updated Project Name"
        fill_in "project_description",  with: "Updated Project Description"
        
        click_button "Update Project"
        
        expect(current_path).to eq(project_path(@project1))
        expect(page).to have_content("Updated Project Name")
        expect(page).to have_content("Updated Project Description")
    end
end