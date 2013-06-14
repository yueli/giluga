class ResourcesController < ApplicationController
  
   layout 'category'
   
  def index
    list
    render ('list')
  end
  
  def list
        
    if (params[:resourceuga] != nil)
     #@resources = Resource.all_with_b(params[:str])
      
      if(params[:str].blank?)
        @resources = Resource.str_all
      else
        if (params[:filter] == "Contains")
          @resources = Resource.contains(params[:str]).sorted

        elsif (params[:filter] == "Begins with")
          @resources = Resource.begins_with(params[:str]).sorted

        else
          @resources = Resource.exact_match(params[:str]).sorted
        end
      end
      
    #elsif (params[:digits])
    elsif (params[:category])
      
      if(params[:category] == 'digits')
        @resources = Resource.alphabet_digits
        
      elsif(params[:category] == 'all')
        @resources = Resource.alphabet_all
        
      else
        @resources = Resource.alphabet_sort_name(params[:category]) + Resource.alphabet_name(params[:category])
        #@resources = Resource.alphabet_name(params[:category]) # no records in the test database
      end

    else
      # Hmm, someone is trying to cause trouble.
      @resources = Resource.alphabet_all
      
    end
    
  end
  
end
