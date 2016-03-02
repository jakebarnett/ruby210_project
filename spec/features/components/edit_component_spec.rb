require "rails_helper"

RSpec.feature "Edit a component" do
    before(:all) do
        Project.destroy_all
        Component.destroy_all
    end
    
    scenario "a user can edit an Component's name" do
        project = FactoryGirl.create(:project)
        component = project.components.create!(name: 'Test Component')
        
        visit project_path(project)
        
        click_link 'Edit Component'
        
        fill_in "component_name", with: "new name"
        click_button "Update Component"
    
        expect(current_path).to eq(project_path(project))
        expect(page).to have_content('new name')
    end
    
end