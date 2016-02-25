require 'rails_helper'

RSpec.feature "Creating a new Attribute" do
    before(:all) do
        Attrib.destroy_all
        @project = FactoryGirl.create(:project)
    end
    
    scenario 'a user can add an Attribute to a project' do
        visit '/projects'
        click_link "Project #{@project.name} Info"
        click_link "Add Attribute"
        
        expect(current_path).to eq(new_project_attrib_path(@project))
        
        fill_in "attrib_name",                 with: "Test Attribute"
        
        click_button "Create Attrib"
        
        expect(current_path).to eq(project_path(@project))
        expect(page).to have_content("Test Attribute")
    end
end