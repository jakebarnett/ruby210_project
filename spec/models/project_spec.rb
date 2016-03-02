require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:all) do 
      @project1 = FactoryGirl.build(:project)
  end

  it 'has a valid factory' do
      expect(@project1).to be_valid
  end

  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:description) }
  
  it { is_expected.to have_many(:components) }
  it { is_expected.to have_many(:attribs) }

  it { is_expected.to validate_presence_of(:name) }
end