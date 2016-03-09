class Component < ActiveRecord::Base
  belongs_to :project
  has_many :capabilities
  has_many :attribs, through: :capabilities
  
  validates :name, presence: true
 end