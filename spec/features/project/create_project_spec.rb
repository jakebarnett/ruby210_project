require 'rails_helper'

RSpec.feature 'Creating a new project', type: :feature do
    scenario 'succeeds with valid values' do
        visit '/projects'
        click_link "New Project"
        
        expect(current_path).to eq(new_project_path)
        
        fill_in "project_name",                 with: "Test Project"
        fill_in "project_description",          with: "Test Project Description"

        click_button "Create Project"
        
        expect(current_path).to eq(project_path(Project.last))
        expect(page).to have_content("Test Project")
    end
    
end