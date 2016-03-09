require "rails_helper"

RSpec.feature "Editing a capability: " do
    before(:all) do
        Project.destroy_all
        Component.destroy_all
        Attrib.destroy_all
        Capability.destroy_all
        @project = FactoryGirl.create(:project)
        @component = @project.components.create(name: 'Test Component')
        @attrib = @project.attribs.create(name: 'Test Attribute')
        @capability = Capability.create(component: @component, attrib: @attrib, name:'Test Capability', description:'This is a test', passing: true)
    end
    
    scenario "a user can edit a capabilitie's description and status" do
        visit project_path(@project)
        expect(current_path).to eq(project_path(@project))
        expect(page).to have_content('This is a test')
        expect(page).to have_content('true')
        
        click_link 'Edit'
        
        fill_in "capability_description", with: "new description"
        uncheck   "capability_passing"
        click_button "Update Capability"
    
        expect(current_path).to eq(project_path(@project))
        expect(page).to have_content('new description')
        expect(page).to have_content('false')
    end
    
end