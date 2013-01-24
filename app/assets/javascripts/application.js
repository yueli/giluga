// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


function getResult() {  
    //var index = document.getElementById('link').selectedIndex;  
    //alert("value="+document.getElementById('link').value);  
    //alert("text="+document.getElementById('popular_db').options[index].text);
    
    if (document.getElementById('link').value != '0') {

    document.forms['popular'].action = "http://www.galileo.usg.edu/express";
    document.forms['popular'].submit();
    }
    
}  
 
function update_resource_div(subject) {  
  jQuery.ajax({
    url: "/update_resources",
    type: "GET",
    data: {"subject" : subject},
    dataType: "html" ,
    success:  function(data) {
      jQuery("#subResource").html(data);
    }
    })
}
    