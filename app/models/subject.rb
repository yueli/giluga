class Subject < ActiveRecord::Base
  
  set_table_name 'Subjects'
  set_primary_key 'SubjectID'
  
  attr_accessible :SubjectName, :TipDesc_1, :tipURL_1, :TipDesc_2, :tipURL_2, :TipDesc_3, :tipURL_3,
  :TipDesc_4, :tipURL_4, :TipDesc_5, :tipURL_5, :TipDesc_6, :tipURL_6
  
  has_many :resources
  
  # Don't need to validate (in most cases):
  # ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :SubjectName
  validates_length_of :SubjectName, :maximum => 255
  # validates_presence_of vs. validates_length_of :minimum => 1
  # different error messages: "can't be blank" or "is too short"
  # validates_length_of allows strings with only spaces!
  
  # named scopes : queries defined
  #scope :visible, where(:visible => true)
  scope :tips, lambda {|arg| where(["SubjectID = ?", "#{arg}"]) }
    
  scope :sorted, order('Subjects.SubjectName ASC')
  #scope :sorted2, order('subjects.SubjectName DESC')
  
  scope :search, lambda {|query| where(["SubjectName LIKE ?", "%#{query}%"])}
  
end
