class Project < ActiveRecord::Base
    has_many :components
    has_many :attribs
    
    validates_presence_of  :name
end