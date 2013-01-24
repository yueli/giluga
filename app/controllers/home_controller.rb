class HomeController < ApplicationController
  
  EBSCO_HOST = "http://preproxy.galib.uga.edu/login?url=http://search.ebscohost.com/login.aspx?direct=true&site=ehost-live&scope=site&type=1&db=a9h&authtype=cookie,ip,uid&bquery=";

  def index
    @popular_db = PopularDb.order("popular_dbs.name ASC")
   # @popular_db.push(['0', "Please select"])
    @subject = Subject.order("subjects.SubjectName ASC")
  end
  
  def search_ehost
  end

end
