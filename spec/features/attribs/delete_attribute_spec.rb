require 'rails_helper'

RSpec.feature "User can delete an attribute" do
    before(:all) do
        Project.destroy_all
        @project1 = FactoryGirl.create(:project)
        @attribute1 = @project1.attribs.create!(name: 'Test Attribute 1')
        @attribute2 = @project1.attribs.create!(name: 'Test Attribute 2')
    end
    
    scenario "a user clicks the delete project link" do
        visit project_path(@project1)
        expect(page).to have_content('Test Attribute 1')
        
        first(:link, 'Edit Attribute').click
        click_link 'Delete'
        
        expect(current_path).to eq(project_path(@project1))
        expect(page).not_to have_content('Test Attribute 1')
    end
end