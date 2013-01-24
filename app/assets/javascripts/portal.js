function bookmark(url, title){
   if(window.sidebar){ // Mozilla/Firefox
      window.sidebar.addPanel(title, url,"");
   }
   else if(window.external){ // IE
      window.external.AddFavorite(url, title);
   }
   else if(window.opera && window.print){ // Opera
      return true; 
   }
}

function goto_resource(){
   var redirect;
   redirect = "http://research.galib.uga.edu/portal_resources.php?id=";
   redirect += document.getElementById('sub_select').value;
   document.location.href = redirect;
}

function swap_selected(elem){
   if(elem){
      if(elem.className == "selected") return;
      var t = document.getElementById("TOPRES");
      var a = document.getElementById("ALLRES");
      var tc = document.getElementById("TOPCONT");
      var ac = document.getElementById("ALLCONT");
      if(t.className == "selected"){
         t.className = "";
         a.className = "selected";
         ac.style.display = "block";
         tc.style.display = "none";
      }
      else{
         t.className = "selected";
         a.className = "";
         ac.style.display = "none";
         tc.style.display = "block";
      }
   }
}//end swap_selected

function open_close(self) {
	self.parentNode.className = (self.parentNode.className == 'closed') ? 'open':'closed';
	return false;
}//end open_close

function open_all(self) {
	var listNodes = self.parentNode.parentNode.getElementsByTagName('div');
	for (var i = 0; i < listNodes.length; i++) {
		if (listNodes[i].className == 'closed') {
			listNodes[i].className = 'open';
		}
	}
	return false;
}//end open_all

function close_all(self) {
	var listNodes = self.parentNode.parentNode.getElementsByTagName('div');
	for (var i = 0; i < listNodes.length; i++) {
		if (listNodes[i].className == 'open') {
			listNodes[i].className = 'closed';
		}
	}
	return false;
}//end closed_all

function handlequicklinks(evt){
   var evt = (evt) ? evt : ((window.event) ? window.event : "");
   if (evt){
      var elem = getTargetElement(evt);
      if(elem){
         if(elem.id == "quick"){
            insertquicklinks();
            return true;
         }
         else if(elem.id != "quick"){
            document.getElementById("quicklinks").innerHTML = "";
            return true;
         }

      }
   }
}//end handleQuickLinks

function handleListClick(elem){
   if (elem){
      var source = elem;
      var sibling = source.nextSibling.nextSibling;
      if(sibling.style.display == "block" || sibling.style.display == ""){
         sibling.style.display = "none";
         source.innerHTML = "[+]&nbsp;";
      }
      else{
         sibling.style.display = "block";
         source.innerHTML = "[-]&nbsp;";
      }
   }
}//end handleListClick

function handleInfoClick(v, id){
   if(v == "more"){
      document.getElementById("more_"+id).style.display = "none";
      document.getElementById("full_"+id).style.display = "";
      document.getElementById("close_"+id).style.display = "";
   }
   else if(v == "close"){
      document.getElementById("more_"+id).style.display = "";
      document.getElementById("full_"+id).style.display = "none";
      document.getElementById("close_"+id).style.display = "none";
   }
}//end handleInfoClick

function getTargetElement(evt){
   var elem;
   if (evt.target)
      elem = (evt.target.nodeType == 3) ? evt.target.parentNode : evt.target;
   else
      elem = evt.srcElement;
    return elem;
}//end getTargetElement

document.onclick = handlequicklinks;
