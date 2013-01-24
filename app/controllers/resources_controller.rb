class ResourcesController < ApplicationController
  def index
  end
  
  def list
    
     
     
    if (params[:resourceuga] != nil)
     #@resources = Resource.all_with_b(params[:str])
      
      if (params[:filter] == "Contains")
        @resources = Resource.begins_with(params[:str])

      elsif (params[:filter] == "Begins with")
        @resources = Resource.begins_with(params[:str])

      else
        @resources = Resource.all_with_b(params[:str])
      end
     
      
    elsif (params[:digits])
      @resources = Resource.all_digits

    elsif (params[:a] )
      @resources = Resource.all_a

    else
      # Hmm, someone is trying to cause trouble.
      @resources = Resource.all_atoz
    end
    
  end
  
  
  
end
