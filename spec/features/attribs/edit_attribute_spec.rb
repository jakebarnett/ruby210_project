require "rails_helper"

RSpec.feature "Edit an attribute" do
    before(:all) do
        @user = FactoryGirl.create(:user)
        sign_in(@user)

        Project.destroy_all
        Attrib.destroy_all
    end
    
    scenario "a user can edit an Attribute's name" do
        project = FactoryGirl.create(:project)
        attribute = project.attribs.create!(name: 'Test Attribute')
        
        visit project_path(project)
        
        click_link 'Edit Attribute'
        
        fill_in "attrib_name", with: "new name"
        click_button "Update Attrib"
    
        expect(current_path).to eq(project_path(project))
        expect(page).to have_content('new name')
    end
    
end