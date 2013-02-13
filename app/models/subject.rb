class Subject < ActiveRecord::Base
  attr_accessible :SubjectName, :TipDesc_1, :TipDesc_2, :TipDesc_3, :TipDesc_4, :TipDesc_5, :TipDesc_6
  has_many :resources
  
  # Don't need to validate (in most cases):
  # ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :SubjectName
  validates_length_of :SubjectName, :maximum => 255
  # validates_presence_of vs. validates_length_of :minimum => 1
  # different error messages: "can't be blank" or "is too short"
  # validates_length_of allows strings with only spaces!
  
  # named scopes : queries defined
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('subjects.SubjectName ASC')
  #scope :sorted2, order('subjects.SubjectName DESC') 
  scope :search, lambda {|query| where(["SubjectName LIKE ?", "%#{query}%"])}
  
end
