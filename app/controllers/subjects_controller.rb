class SubjectsController < ApplicationController

 layout 'chooseSub'
 
def index
  list
  render('list')
  
end

  def list
    
    if(params[:search])
      @subjects = Subject.search(params[:search]).sorted
    else
      @subjects = Subject.sorted # all subjects with the order("subjects.SubjectName ASC")
    end
     
      if (params[:subject])
        sid = params[:subject]
      else
        sid = '1'
      end
      
      @subject = Subject.where(["SubjectID = ?", sid]).first
      @resources = Resource.relevant_on_subject(sid)
      @types = Type.type_on_subject(sid).skip.sorted
      
      @more_resources = get_more_resource(sid,@types)
    
  end
  
  def update_resources
    
    if not params[:subject]
      list
      render('list')
    end
    
    @resources = Resource.relevant_on_subject(params[:subject])
    @subject = Subject.where(["SubjectID = ?", params[:subject]]).first
    @types = Type.type_on_subject(params[:subject]).skip.sorted
    
    @more_resources = get_more_resource(params[:subject],@types)
    
    # render :partial => "resources/sublist", :object => @resources
    if not @more_resources.nil?
         render :partial => "resources/sublist", :local => { :resources => @resources,
      :subject => @subject, :types => @types, :more_resources => @more_resources }
    else
        render :partial => "resources/sublist", :local => { :resources => @resources,
      :subject => @subject, :types => nil }
    end
    
  end
  
  def show
    @subject = Subject.find(params[:SubjectID])
  end

  private
  
  def get_more_resource id, type_list
    result = Hash.new
    if not type_list.nil?
      type_list.collect do |type|
         result[:"#{type['TypeID']}"] = Resource.more_on_subject(id).by_type("#{type['TypeID']}")
         #result[:"#{type['TypeID']}"]  = Resource.more_on_subject(id)
      #end.compact! # remove nil instances
      end
    end
    
    return result
  end
  
end
