require 'rails_helper'

RSpec.feature "Creating a new capability" do
    before(:all) do
        Project.destroy_all
        Component.destroy_all
        Attrib.destroy_all
        Capability.destroy_all
        @project = FactoryGirl.create(:project)
        @attrib = @project.attribs.create!(name: 'Test Attribute')
        @component = @project.components.create!(name: 'Test Component')
    end
    
    scenario 'a user adds a capability to an attribute/component intersection' do
        visit project_path(@project)

        click_link "Add Capability"
        
        fill_in "capability_name", with: "Test Capability"
        fill_in "capability_description", with: "This tests a thing!"
        check   "capability_passing"
        
        click_button "Create Capability"

        
        expect(current_path).to eq(project_path(@project))
        expect(page).to have_content("This tests a thing!")
        expect(page).to have_content('true')
    end
end