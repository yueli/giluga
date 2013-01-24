class SubjectsController < ApplicationController

 layout 'chooseSub'
 
def index
  list
  render('list')
  
end

  def list
    @subjects = Subject.order("subjects.SubjectName ASC")
    
    if (params[:subject])
      @resources = Resource.related_on_subject(params[:subject])
    else
      @resources = Resource.find_first
    end
  
    #respond_to do |format|
      #format.html #list.html.erb
     # format.js {}
    #end
  end
  
  def update_resources
    @resources = Resource.related_on_subject(params[:subject])
    render :partial => "resources/sublist", :object => @resources
  end
    

  def show
    @subject = Subject.find(params[:SubjectID])
  end

end
