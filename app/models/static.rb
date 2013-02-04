class Static < ActiveRecord::Base
  
  LOGO_DISPLAY_2 = "<img src='/assets/fundbyuga.gif' title='Funded by the UGA Libraries' alt='Funded by the UGA Libraries'>"
  LOGO_DISPLAY_1 = "<img src='/assets/fundbygalileo.gif' title='Funded by GALILEO' alt='Funded by GALILEO'>"
  LOGO_DISPLAY_3 = "<img src='/assets/fundbylaw.gif' title='Funded by the UGA Law Library' alt='Funded by the UGA Law Library'>"
  LOGO_DISPLAY_4 = LOGO_DISPLAY_2 + LOGO_DISPLAY_3
  LOGO_DISPLAY_5 = LOGO_DISPLAY_2 + LOGO_DISPLAY_1
  
  NEW_ICON = "<img src='/assets/new.gif' title='New Database'>"
  
  ACCESS_TYPE_1 = "<strong>Online Access:</strong> On Campus Only<br>"
  ACCESS_TYPE_2 = "<strong>Online Access:</strong> On/Off Campus.
  <a href='https://gil.uga.edu/cgi-bin/Pwebrecon.cgi?DB=local&amp;PAGE=REQNOBIB' class='access'>GALILEO Password</a>
  required for off campus access.<br>"
  ACCESS_TYPE_3 = "<strong>Online Access:</strong> On/Off Campus<br>"
  
  LOCATION_1 = "Main Library Only</li>"
  LOCATION_2 = "Main Library Reference Collection</li>"
  LOCATION_3 = "Main Library Government Document Stacks</li>"
  LOCATION_5 = "Science Library Only</li>"
  LOCATION_6 = "Science Library Reference Collection</li>"
  LOCATION_7 = "Science Library Government Document Stacks</li>"
  
end
