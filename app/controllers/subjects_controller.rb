class SubjectsController < ApplicationController

 layout 'chooseSub'
 
def index
  list
  render('list')
  
end

  def list
    @subjects = Subject.order("subjects.SubjectName ASC")
    
    # where clause return a collection, so chain it with first for single record
    if (params[:subject])
      @subject = Subject.where(["SubjectID = ?", params[:subject]]).first
      @resources = Resource.relevant_on_subject(params[:subject])
    else
      @subject = Subject.where(["SubjectID = ?","1"]).first
      @resources = Resource.rellevant_on_subject(@subject.SubjectID)
    end
  
  end
  
  def update_resources
    @resources = Resource.related_on_subject(params[:subject])
    @subject = Subject.where(["SubjectID = ?", params[:subject]]).first
    
    # render :partial => "resources/sublist", :object => @resources
    render :partial => "resources/sublist", :local => { :resources => @resources,
      :subject => @subject }
  end
    

  def show
    @subject = Subject.find(params[:SubjectID])
  end

end
