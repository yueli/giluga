class PopularDb < ActiveRecord::Base
  attr_accessible :code, :name
  
  scope :sorted, order('Popular_dbs.Name ASC')
  
end
