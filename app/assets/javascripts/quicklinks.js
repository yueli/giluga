function insertquicklinks(){
var anchors;
anchors = "<a href='http://dataserv.libs.uga.edu/assessment/index.html'>assessment@uga</a>";
anchors += "<a href='http://www.libs.uga.edu/access_services/borrowing/index.html'>borrowing materials</a>";
anchors += "<a href='http://www.libs.uga.edu/ref/citation.html'>citation guides</a>";
anchors += "<a href='http://www.libs.uga.edu/ref/instruction/index.html'>classes/consultations</a>";
anchors += "<a href='http://www.libs.uga.edu/liaison/endnote/endnote.html'>Endnote</a>";
anchors += "<a href='http://www.libs.uga.edu/finditfaq.html'>Find It FAQ</a>";
anchors += "<a href='http://www.libs.uga.edu/researchcentral/working/navigating/floor.html'>floor maps</a>";
anchors += "<a href='http://www.libs.uga.edu/forms.html'>forms</a>";
anchors += "<a href='http://www.libs.uga.edu/password.html'>GALILEO password</a>";
anchors += "<a href='http://www.libs.uga.edu/researchcentral/subjectguides/genealogy.html'>genealogy research</a>";
anchors += "<a href='http://www.libs.uga.edu/gawriters/'>Ga. Writers Hall of Fame</a>";
anchors += "<a href='http://www.libs.uga.edu/access_services/gilexpress.html'>GIL Express</a>";
anchors += "<a href='http://www.libs.uga.edu/ill/index.html'>Interlibrary Loan</a>";
anchors += "<a href='http://www.libs.uga.edu/humres/jobs/index.html'>jobs in the library</a>";
anchors += "<a href='http://www.libs.uga.edu/disabil/disabilities.html'>patrons with disabilities</a>";
anchors += "<a href='http://www.libs.uga.edu/refworks/index.html'>RefWorks</a>";
anchors += "<a href='http://www.libs.uga.edu/access_services/onlineforms/repository.html'>repository request</a>";
anchors += "<a href='http://www.libs.uga.edu/access_services/reserves.html'>reserves</a>";
anchors += "<a href='http://www.libs.uga.edu/staff/index.html'>staff resources</a>";
anchors += "<a href='http://www.slc.uga.edu/'>Student Learning Center</a>";
anchors += "<a href='http://lotus.libs.uga.edu/techsupport/'>tech support</a>";
anchors += "<a href='http://www.libs.uga.edu/howdoi/go_wireless.html'>wireless access</a>";
anchors += "<a href='javascript:void(0)'><strong>close quicklinks</strong><img src='http://www-test.libs.uga.edu/shared/graphics/xbox.gif' border='0'></a>";

document.getElementById('quicklinks').innerHTML = "";
document.getElementById('quicklinks').innerHTML = anchors;
}
