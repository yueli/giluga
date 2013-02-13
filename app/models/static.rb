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
  
  #ALPHABET_LIST = [{"0-9"=>'digits'},{"A"=>'a'},{"B"=>'b'},{"C"=>'c'},{"D"=>'d'},
   #                {"E"=>'e'},{"F"=>'f'},{"G"=>'g'},{"H"=>'h'},{"I"=>'i'},{"J"=>'j'},{"K"=>'k'},
   #                {"L"=>'l'},{"M"=>'m'},{"N"=>'n'},{"O"=>'o'},{"P"=>'p'},{"R"=>'r'},
   #                {"S"=>'s'},{"T"=>'t'},{"U"=>'u'},{"V"=>'v'},{"W"=>'w'},{"Z"=>'z'},{"A-Z"=>'all'}]
  
  ALPHABET_LIST = [{"key"=>"0-9", "value" =>'digits'},{"key"=>"A", "value"=>'a'},{"key"=>"B", "value"=>'b'},{"key"=>"C", "value"=>'c'},{"key"=>"D", "value"=>'d'},
                   {"key"=>"E", "value"=>'e'},{"key"=>"F", "value"=>'f'},{"key"=>"G", "value"=>'g'},{"key"=>"H", "value"=>'h'},{"key"=>"I", "value"=>'i'},{"key"=>"J", "value"=>'j'},{"key"=>"K", "value"=>'k'},
                   {"key"=>"L", "value"=>'l'},{"key"=>"M", "value"=>'m'},{"key"=>"N", "value"=>'n'},{"key"=>"O", "value"=>'o'},{"key"=>"P", "value"=>'p'},{"key"=>"R", "value"=>'r'},
                   {"key"=>"S", "value"=>'s'},{"key"=>"T", "value"=>'t'},{"key"=>"U", "value"=>'u'},{"key"=>"V", "value"=>'v'},{"key"=>"W", "value"=>'w'},{"key"=>"Z", "value"=>'z'},{"key"=>"A-Z", "value"=>'all'}]
  
  
  
end
