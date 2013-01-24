class Resource < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :name
  
  belongs_to :subject
  #, {:foreign_key => "subject_id"}
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
    
  #validates_presence_of :permalink
  #validates_length_of :permalink, :within => 3..255
  # use presence with length to disallow spaces
  #validates_uniqueness_of :permalink
  # for unique values by subject, :scope => :subject_id

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('resources.title ASC')

  scope :all_digits, where(["Production=? AND door_id IS NOT NULL AND door_id != '' ", "Y"])
                      .where(["sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? ", "0%", "1%","2%","3%"])
  # $query = "SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y' AND door_id IS NOT NULL AND door_id !='' AND (sort_name LIKE '0%'";

  scope :all_a, where(["Production=? AND door_id IS NOT NULL AND door_id != '' ", "Y"])
                      .where(["(sort_name IS NULL AND name LIKE ? ) OR (sort_name IS NOT NULL AND sort_name LIKE ? )", "a%", "a%"])
  # SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y'
  # AND door_id IS NOT NULL AND door_id !='' AND name LIKE '$key%' AND sort_name IS NULL
  # UNION
  # SELECT *,IFNULL(sort_name,name) AS Title
  # FROM Resources WHERE Production = 'Y' AND door_id IS NOT NULL AND door_id !=''
  # AND sort_name LIKE '$key%' AND sort_name IS NOT NULL ORDER BY Title
  
  scope :all_atoz, where(["Production=? AND door_id IS NOT NULL AND door_id != '' ", "Y"])
  
  # SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y' AND name LIKE '$str%' OR parenthetical LIKE '$str%' ORDER BY Title

  scope :all_with_b, lambda {|arg| where(["Production = ? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "#{arg}%", "#{arg}%"]) unless arg.nil? }

  #scope :all_with_c,
  #scope :all_with_e,
  
  def self.begins_with(arg)
    where(["Production = ? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "#{arg}%", "#{arg}%"]) unless arg.nil? 
  end
 
 # For query: SELECT *,IFNULL(sort_name,name) AS Title FROM Resources JOIN ResourceSubjects 
 #		ON Resources.Production = 'Y' AND Resources.ResourceID = ResourceSubjects.ResourceID AND ResourceSubjects.SubjectID = '$sub_id'";
 
  scope :related_on_subject, lambda {|arg| select('IFNULL(sort_name,name) AS Title, Resources.name, Resources.sort_Name, rs.ResourceID, Resources.description, Resources.PublicURL').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? ", "Y", "#{arg}"]) unless arg.nil? }
end
