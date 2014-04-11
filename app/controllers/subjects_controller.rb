class SubjectsController < ApplicationController

 layout 'category'
 
  def index
   list
   render('list')
  end

  def list
    
    #  Initialize @subjects to all subjects with the order("subjects.SubjectName ASC")
    #  Then set the subject id to the selected id from index page, otherwise the first one of @subjects from above  
    #  If search input field has any input, @subjects will be overwritten
    #  and subject id will be the first record of @subjects
    
      @subjects = Subject.sorted
      
      if (params[:subject])
        sid = params[:subject]
      else
         sid = @subjects[0].SubjectID   
      end
      
      if params[:search] and (not Subject.search(params[:search])[0].nil?)
             @subjects = Subject.search(params[:search]).sorted
             sid = @subjects[0].SubjectID
      end
      
    # Get info for this selected subject
    
      @subject = Subject.where(["SubjectID = ?", sid]).first
      @tip = Subject.tips(sid).first
      @resources = Resource.relevant_on_subject(sid)
      @resourceNarrowers = Resource.narrower_on_subject(sid)
      @resourceBroaders = Resource.broader_on_subject(sid)
      @types = Type.type_on_subject(sid).skip.sorted
      
      @more_resources = get_more_resource(sid,@types)
      
      respond_to do |format|
       format.html # show.html.erb
      end
  end

  def refresh
      @subjects = Subject.sorted
      @subject = Subject.where(["SubjectID = ?", params[:subject]]).first
      @tip = Subject.tips(params[:subject]).first
      @types = Type.type_on_subject(params[:subject]).skip.sorted
      
      @resources = Resource.relevant_on_subject(params[:subject])
      @resourceNarrowers = Resource.narrower_on_subject(params[:subject])
      @resourceBroaders = Resource.broader_on_subject(params[:subject])
      
      @more_resources = get_more_resource(params[:subject],@types)
  
      respond_to do |format|
          format.js
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
