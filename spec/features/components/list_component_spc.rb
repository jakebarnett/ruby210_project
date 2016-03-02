require "rails_helper"

RSpec.feature "Lists components for a project" do
    before(:all) do
        Project.destroy_all
        Component.destroy_all
        @project = FactoryGirl.create(:project)
        @component1 = @project.attribs.create!(name: 'Test Component 1')
        @component2 = @project.attribs.create!(name: 'Test Component 2')
    end
    
    scenario "navigating to a project lists all of its components" do
        visit project_path(@project)
        expect(current_path).to eq(project_path(@project))
        
        expect(page).to have_content('Test Component 1')
        expect(page).to have_content('Test Component 2')
    end
    
end