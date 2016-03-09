require 'rails_helper'

RSpec.feature "User can delete a component" do
    before(:all) do
        @user = FactoryGirl.create(:user)
        sign_in(@user)

        Project.destroy_all
        @project1 = FactoryGirl.create(:project)
        @component1 = @project1.components.create!(name: 'Test Component 1')
        @component2 = @project1.components.create!(name: 'Test Component 2')
    end
    
    scenario "a user clicks the delete component link" do
        visit project_path(@project1)
        expect(page).to have_content('Test Component 1')
        
        first(:link, 'Edit Component').click
        click_link 'Delete'
        
        expect(current_path).to eq(project_path(@project1))
        expect(page).not_to have_content('Test Component 1')
    end
end