class HomeController < ApplicationController
  
  EBSCO_HOST = "http://preproxy.galib.uga.edu/login?url=http://search.ebscohost.com/login.aspx?direct=true&site=ehost-live&scope=site&type=1&db=a9h&authtype=cookie,ip,uid&bquery=";

  def index
   # @popular_db = PopularDb.order("Popular_dbs.name ASC")

    @subject = Subject.order("Subjects.SubjectName ASC")
  end
  
  def search_ehost
  end

  def routing_error
    render "404", :status => 404
  end
  
end
