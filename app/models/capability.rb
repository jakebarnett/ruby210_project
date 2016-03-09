class Capability < ActiveRecord::Base
    belongs_to :component
    belongs_to :attrib
    
    validates :name, presence: true
    validates :description, presence: true
end