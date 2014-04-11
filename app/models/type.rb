class Type < ActiveRecord::Base
  
  
  set_table_name 'Types'
  set_primary_key 'TypeID'
 
  attr_accessible :TypeID, :TypeName
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
  scope :type_on_subject, lambda {|arg| select('DISTINCT Types.TypeID, Types.TypeName').\
                                            joins('LEFT JOIN ResourceTypes rt ON Types.TypeID = rt.TypeID').\
                                            joins('LEFT JOIN ResourceSubjects rs ON rt.SubjectID = rs.SubjectID').\
                                            where(["rt.TypeAssigned = ? AND rs.OtherResourceList = ? AND rs.SubjectID = ? ", "Y", "Y","#{arg}"]) }

  scope :sorted, order('Types.TypeName ASC')
  scope :skip, where(["TypeName != ?", 'Article Databases'])
  
  
  
end