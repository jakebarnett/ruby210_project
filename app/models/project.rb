class Project < ActiveRecord::Base
    has_many :components, dependent: :destroy
    has_many :attribs, dependent: :destroy
    
    validates_presence_of  :name
end