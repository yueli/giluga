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
//= require_directory .

// this function not in use
function ehost_search() {

    var url="http://preproxy.galib.uga.edu/login?url=http://search.ebscohost.com/login.aspx?direct=true&site=ehost-live&scope=site&type=1&db=a9h&authtype=cookie,ip,uid&bquery=";

    url.src="http://supportforms.epnet.com/eit/scripts/ehostsearch.js";
        
    document.forms['ehost_searchbox'].action = "javascript:ebscoHostSearchGo(url);";
    
    document.forms['ehost_searchbox'].submit();


}

function getResult() {  
    //var index = document.getElementById('link').selectedIndex;  
    //alert("value="+document.getElementById('link').value);  
    //alert("text="+document.getElementById('popular_db').options[index].text);
    
    if (document.getElementById('link').value != '0') {

    document.forms['popular'].action = "http://www.galileo.usg.edu/express";
    document.forms['popular'].submit();
    }
    
}  

function refresh_resource_div() {  
  jQuery.ajax({
    url: "/research/subjects/refresh",
    type: "GET",
    data: {
        "subject" : $('#subject_select').val()
        },
    dataType: "script" 
    
    })
}

/* tabbable tabs for more resources on specific subject */

/* replaced by refresh_resource_div */
/*
 *function update_resource_div(subject) {  
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
*/