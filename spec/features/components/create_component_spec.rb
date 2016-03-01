require 'rails_helper'

RSpec.feature "Creating a new Component" do
    before(:all) do
    #     Attrib.destroy_all
        @project = FactoryGirl.create(:project)
    end
    
    scenario 'a user can add  Component to a project' do
        visit '/projects'
        click_link "Project #{@project.name} Info"
        click_link "Add Component"
        
        expect(current_path).to eq(new_project_component_path(@project))
        
        fill_in "component_name",                 with: "Test Component"
        
        click_button "Create Component"
        
        expect(current_path).to eq(project_path(@project))
        expect(page).to have_content("Test Component")
    end
end