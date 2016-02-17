require 'rails_helper'

RSpec.feature "Lists all the projects", type: :feature do
    scenario "it lets users know if there are no projects" do
        visit '/projects'
        
        expect(current_path).to eq(projects_path)
        expect(page).to have_content('0 projects')
    end
    
    context "there are projects in the database" do
        before(:all) do
          @project1 = FactoryGirl.create(:project)
          @project2 = FactoryGirl.create(:project)
          @project3 = FactoryGirl.create(:project)
          @project4 = FactoryGirl.create(:project)
        end
        
        scenario "it lists all the projects" do
            visit '/projects'
            
            expect(current_path).to eq(projects_path)
            expect(page).to have_content('4 projects')
            expect(page).to have_content(@project1.name)
            expect(page).to have_content(@project1.description)
            expect(page).to have_content(@project2.name)
            expect(page).to have_content(@project2.description)
            expect(page).to have_content(@project3.name)
            expect(page).to have_content(@project3.description)
            expect(page).to have_content(@project4.name)
            expect(page).to have_content(@project4.description)
        end
    end
end