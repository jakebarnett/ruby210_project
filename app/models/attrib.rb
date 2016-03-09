class Attrib < ActiveRecord::Base
  belongs_to :project
  has_many :capabilities
  has_many :components, through: :capabilities
  

  validates :name, presence: true
 end