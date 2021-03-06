require 'rails_helper'

RSpec.describe Attrib, type: :model do 
  it 'belongs to a project' do 
    project = FactoryGirl.create(:project)
    task = project.attribs.build(name: 'Test Attrib')
    
    expect(task.project).to eq(project)
  end
  
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to validate_presence_of(:name) }
end