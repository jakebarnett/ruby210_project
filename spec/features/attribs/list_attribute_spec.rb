require "rails_helper"

RSpec.feature "Lists attributes for a project" do
    before(:all) do
        Project.destroy_all
        Attrib.destroy_all
        @project = FactoryGirl.create(:project)
        @attribute1 = @project.attribs.create!(name: 'Test Attribute 1')
        @attribute2 = @project.attribs.create!(name: 'Test Attribute 2')
    end
    
    scenario "navigating to a project lists all of its attributes" do
        visit project_path(@project)
        expect(current_path).to eq(project_path(@project))
        
        expect(page).to have_content('Test Attribute 1')
        expect(page).to have_content('Test Attribute 2')
    end
    
end