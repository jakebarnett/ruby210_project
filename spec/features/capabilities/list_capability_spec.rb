require "rails_helper"

RSpec.feature "Lists all capabilities for a project" do
    before(:all) do
        @user = FactoryGirl.create(:user)
        sign_in(@user)

        Project.destroy_all
        Component.destroy_all
        Attrib.destroy_all
        Capability.destroy_all
        @project = FactoryGirl.create(:project)
        @component = @project.components.create(name: 'Test Component')
        @attrib = @project.attribs.create(name: 'Test Attribute')
        @capability = Capability.create(component: @component, attrib: @attrib, name:'Test Capability', description:'This is a test', passing: true)
    end
    
    scenario "navigating to a project lists all of its attributes" do
        visit project_path(@project)
        expect(current_path).to eq(project_path(@project))
        
        expect(page).to have_content('This is a test')
        expect(page).to have_content('true')
    end
    
end