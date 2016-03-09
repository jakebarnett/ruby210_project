require 'rails_helper'

RSpec.describe Capability, type: :model do 
    before(:all) do
        @project = FactoryGirl.create(:project)
        @component = @project.components.create(name: 'Test Component')
        @attrib = @project.attribs.create(name: 'Test Attribute')
        @capability = Capability.create(component: @component, 
                                        attrib: @attrib, 
                                        name:'Test Capability', 
                                        description:'This is a test', 
                                        passing: true)
    end


    it { is_expected.to have_db_column(:attrib_id) }
    it { is_expected.to have_db_column(:component_id) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:passing) }
    
    it { is_expected.to belong_to(:attrib) }
    it { is_expected.to belong_to(:component) }
end