require "rails_helper"

RSpec.feature "Deleting a capability: " do
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
  
    scenario "clicking the delete link deletes it" do
      visit project_path(@project)
      expect(current_path).to eq(project_path(@project))
      expect(page).to have_content('This is a test')
      expect(page).to have_content('true')
      
      click_link 'Edit'
      click_link 'Delete Capability'
      
      expect(current_path).to eq(project_path(@project))
      expect(page).not_to have_content('new description')
    end
end