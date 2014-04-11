class Resource < ActiveRecord::Base
  
  set_table_name 'Resources'
  set_primary_key 'ResourceID'
  
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
  scope :sorted, order('Title ASC')

  # SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y' AND door_id IS NOT NULL
  # AND door_id !='' AND (sort_name LIKE '0%') ORDER BY Title);
  
  scope :alphabet_digits,
        :select => " *, IFNULL(sort_name,name) AS Title ",
        :conditions => ["Production=? AND door_id IS NOT NULL AND door_id != '' AND
                       (sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ?
                      OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ? OR sort_name LIKE ?) ", "Y","0%","1%","2%","3%","4%","5%","6%","7%","8%","9%" ],
        :order => "Title"
        
  # SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y'
  #   AND door_id IS NOT NULL AND door_id !='' AND name LIKE '$key%' AND sort_name IS NULL
  #   UNION SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y'
  #   AND door_id IS NOT NULL AND door_id !='' AND sort_name LIKE '$key%'
  #   AND sort_name IS NOT NULL ORDER BY Title
  
  scope :alphabet_sort_name, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                        where(["Production=? AND door_id IS NOT NULL AND door_id != '' AND sort_name IS NOT NULL AND sort_name LIKE ? ", "Y", "#{arg}%"]) }
  
  scope :alphabet_name, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                        where(["Production=? AND door_id IS NOT NULL AND door_id != '' AND sort_name IS NULL AND name LIKE ? ", "Y", "#{arg}%"]) }
  
 
  #scope :all_a, where(["Production=? AND door_id IS NOT NULL AND door_id != '' ", "Y"])
  #                    .where(["(sort_name IS NULL AND name LIKE ? ) OR (sort_name IS NOT NULL AND sort_name LIKE ? )", "a%", "a%"])

  
  scope :alphabet_all, where(["Production=? AND door_id IS NOT NULL AND door_id != '' ", "Y"])
  
  # for empty [:str]
  scope :str_all,
        :select => " *, IFNULL(sort_name,name) AS Title ",
        :conditions => ["Production=? ", "Y" ],
        :order => "Title"
  
  # SELECT *,IFNULL(sort_name,name) AS Title FROM Resources WHERE Production = 'Y' AND name LIKE '$str%' OR parenthetical LIKE '$str%' ORDER BY Title

  scope :begins_with, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                        where(["Production=? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "#{arg}%", "#{arg}%"]) }
  
  scope :contains, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                        where(["Production=? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "%#{arg}%", "%#{arg}%"]) }
  
  scope :exact_match, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                        where(["Production=? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "#{arg}", "#{arg}"]) }
  
  #def self.begins_with(arg)
  #  where(["Production = ? AND name LIKE ? OR parenthetical LIKE ? ", "Y", "#{arg}%", "#{arg}%"]) unless arg.nil? 
  #end
  
 # For query: SELECT *,IFNULL(sort_name,name) AS Title FROM Resources JOIN ResourceSubjects 
 #		ON Resources.Production = 'Y' AND Resources.ResourceID = ResourceSubjects.ResourceID AND ResourceSubjects.SubjectID = '$sub_id'";
 # Resources.name, Resources.sort_Name, rs.ResourceID, Resources.description, Resources.PublicURL
  scope :related_on_subject, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? ", "Y", "#{arg}"]) unless arg.nil? }
  
  scope :relevant_on_subject, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? AND rs.TopResourceScope = ?", "Y", "#{arg}", "Key"]) unless arg.nil? }
  

  scope :narrower_on_subject, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? AND rs.TopResourceScope = ?", "Y", "#{arg}", "Narrower"]) unless arg.nil? }


  scope :broader_on_subject, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? AND rs.TopResourceScope = ? ", "Y", "#{arg}", "Broader"]) unless arg.nil? }

  # SELECT * FROM 
			#Types JOIN ResourceTypes ON Types.TypeID = ResourceTypes.TypeID 
			#AND ResourceTypes.SubjectID = '$sub_id' 
			#AND ResourceTypes.TypeAssigned = 'Y')
			#JOIN ResourceSubjects ON ResourceSubjects.SubjectID = '$sub_id'
			#AND ResourceSubjects.OtherResourceList = 'Y'
			#GROUP BY TypeName
  scope :by_type, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["Resources.Production = ? AND rs.SubjectID = ? AND rs.TopResourceScope = ? ", "Y", "#{arg}", "Broader"]) unless arg.nil? }

  # SELECT *, IFNULL(sort_name,name) AS Title FROM
	#			(Resources JOIN ResourceTypes ON Resources.Production = 'Y' 
	#			AND Resources.ResourceID = ResourceTypes.ResourceID 
	#			AND ResourceTypes.SubjectID = '$sub_id' 
	# put in the next step:			AND ResourceTypes.TypeID = '$type_id' 
	#			AND ResourceTypes.TypeAssigned = 'Y')
	#			JOIN ResourceSubjects ON Resources.ResourceID = ResourceSubjects.ResourceID
	#			AND ResourceSubjects.SubjectID = '$sub_id'
	#			AND ResourceSubjects.OtherResourceList = 'Y' ORDER BY Title

  scope :more_on_subject, lambda {|arg| select('*, IFNULL(sort_name,name) AS Title').\
                                            joins('LEFT JOIN ResourceTypes rt ON Resources.ResourceID = rt.ResourceID').\
                                            joins('LEFT JOIN ResourceSubjects rs ON Resources.ResourceID = rs.ResourceID').\
                                            where(["rs.SubjectID = rt.SubjectID AND Resources.Production = ? AND rs.SubjectID = ? AND rs.OtherResourceList = ? ", "Y", "#{arg}", "Y" ])  }
  
  # AND ResourceTypes.TypeID = '$type_id' 
  scope :by_type, lambda {|arg| where(["rt.TypeID = ?", "#{arg}"]) }


end
