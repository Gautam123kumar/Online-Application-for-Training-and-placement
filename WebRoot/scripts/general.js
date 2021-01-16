function check(form)
{
   if(!form.ch.checked)
   {
         form.ownquest.disabled=true;
         form.squest.disabled=false;
   }
   else
   {
         form.ownquest.disabled=false;
         form.squest.disabled=true;
   }
}
function graduatecheck(form)
{
   if(!form.ch.checked)
   {
   	  form.yearofpass3.disabled=true;
      form.percentage3.disabled=true;
   }
   else
   {
      form.yearofpass3.disabled=false;
      form.percentage3.disabled=false;
   }
   fillcourse(form);
}

function fillcourse(acadamic)
{
	acadamic.course.length=5;
	acadamic.course.options(0).text="BTech";
	acadamic.course.options(0).value="BTech";
	acadamic.course.options(1).text="BSc";
	acadamic.course.options(1).value="BSc";
	acadamic.course.options(2).text="MSc";
	acadamic.course.options(2).value="MSc";
	acadamic.course.options(3).text="MTech";
	acadamic.course.options(3).value="MTech";
	acadamic.course.options(4).text="MCA";
	acadamic.course.options(4).value="MCA";
	getdiscipline(acadamic);
}


function bcode(bancode)
{
	bancode.bcode.length=5;
	bancode.bcode.options(0).text="01";
	bancode.bcode.options(0).value="01";
	bancode.bcode.options(1).text="02";
	bancode.bcode.options(1).value="02";
	bancode.bcode.options(2).text="03";
	bancode.bcode.options(2).value="03";
	bancode.bcode.options(3).text="04";
	bancode.bcode.options(3).value="04";
	bancode.bcode.options(4).text="05";
	bancode.bcode.options(4).value="05";
	getdiscipline(bancode);
}



function getdiscipline(acadamic)
{
    switch(acadamic.course.value) 
	{
	   case "BTech":
	        acadamic.discipline.length=6;
			acadamic.discipline.options(0).text="Electronics";
			acadamic.discipline.options(0).value="Electronics";
			acadamic.discipline.options(1).text="Electrical";
			acadamic.discipline.options(1).value="Electrical";
			acadamic.discipline.options(2).text="Mechanical";
			acadamic.discipline.options(2).value="Mechanical";
			acadamic.discipline.options(3).text="Computer Science";
			acadamic.discipline.options(3).value="Computer Science";
			acadamic.discipline.options(4).text="Information Technology";
			acadamic.discipline.options(4).value="Information Technology";
			acadamic.discipline.options(5).text="Instrumentation";
			acadamic.discipline.options(5).value="Instrumentation";
			
			acadamic.semister.length=8;
			acadamic.semister.options(0).text="First";
			acadamic.semister.options(0).value="First";
			acadamic.semister.options(1).text="Second";
			acadamic.semister.options(1).value="Second";
			acadamic.semister.options(2).text="Third";
			acadamic.semister.options(2).value="Third";
			acadamic.semister.options(3).text="Fourth";
			acadamic.semister.options(3).value="Fourth";
			acadamic.semister.options(4).text="Fifth";
			acadamic.semister.options(4).value="Fifth";
			acadamic.semister.options(5).text="Sixth";
			acadamic.semister.options(5).value="Sixth";
			acadamic.semister.options(6).text="Seventh";
			acadamic.semister.options(6).value="Seventh";
			acadamic.semister.options(7).text="Eigth";
			acadamic.semister.options(7).value="Eigth";
			break;
			
		case "BSc":
	        acadamic.discipline.length=3;
			acadamic.discipline.options(0).text="Electronics";
			acadamic.discipline.options(0).value="Electronics";
			acadamic.discipline.options(1).text="Mathematics";
			acadamic.discipline.options(1).value="Mathematics";
			acadamic.discipline.options(2).text="Computers";
			acadamic.discipline.options(2).value="Computers";
			
			
			acadamic.semister.length=6;
			acadamic.semister.options(0).text="First";
			acadamic.semister.options(0).value="First";
			acadamic.semister.options(1).text="Second";
			acadamic.semister.options(1).value="Second";
			acadamic.semister.options(2).text="Third";
			acadamic.semister.options(2).value="Third";
			acadamic.semister.options(3).text="Fourth";
			acadamic.semister.options(3).value="Fourth";
			acadamic.semister.options(4).text="Fifth";
			acadamic.semister.options(4).value="Fifth";
			acadamic.semister.options(5).text="Sixth";
			acadamic.semister.options(5).value="Sixth";
			break;
			
		case "MSc":
	        acadamic.discipline.length=3;
			acadamic.discipline.options(0).text="Electronics";
			acadamic.discipline.options(0).value="Electronics";
			acadamic.discipline.options(1).text="Mathematics";
			acadamic.discipline.options(1).value="Mathematics";
			acadamic.discipline.options(2).text="Computers";
			acadamic.discipline.options(2).value="Computers";
			
			acadamic.semister.length=4;
			acadamic.semister.options(0).text="First";
			acadamic.semister.options(0).value="First";
			acadamic.semister.options(1).text="Second";
			acadamic.semister.options(1).value="Second";
			acadamic.semister.options(2).text="Third";
			acadamic.semister.options(2).value="Third";
			acadamic.semister.options(3).text="Fourth";
			acadamic.semister.options(3).value="Fourth";
			break;
			
		case "MTech":
	        acadamic.discipline.length=8;
			acadamic.discipline.options(0).text="Power Electronics"; 
			acadamic.discipline.options(0).value="Power Electronics"; 
			acadamic.discipline.options(1).text="Electrical";
			acadamic.discipline.options(1).value="Electrical";
			acadamic.discipline.options(2).text="Mechanical";
			acadamic.discipline.options(2).value="Mechanical";
			acadamic.discipline.options(3).text="Computer Science";
			acadamic.discipline.options(3).value="Computer Science";
			acadamic.discipline.options(4).text="Information Technology";
			acadamic.discipline.options(4).value="Information Technology";
			acadamic.discipline.options(5).text="Instrumentation";
			acadamic.discipline.options(5).value="Instrumentation";	
			acadamic.discipline.options(6).text="Aeronotics";
			acadamic.discipline.options(6).value="Aeronotics";
			acadamic.discipline.options(7).text="Automobile";
			acadamic.discipline.options(7).value="Automobile";
			
			acadamic.semister.length=4;
			acadamic.semister.options(0).text="First";
			acadamic.semister.options(0).value="First";
			acadamic.semister.options(1).text="Second";
			acadamic.semister.options(1).value="Second";
			acadamic.semister.options(2).text="Third";
			acadamic.semister.options(2).value="Third";
			acadamic.semister.options(3).text="Fourth";
			acadamic.semister.options(3).value="Fourth";
			break;	
			
			case "MCA":
	        acadamic.discipline.length=1;
			acadamic.discipline.options(0).text="Computers";
			acadamic.discipline.options(0).value="Computers";
			
			acadamic.semister.length=6;
			acadamic.semister.options(0).text="First";
			acadamic.semister.options(0).value="First";
			acadamic.semister.options(1).text="Second";
			acadamic.semister.options(1).value="Second";
			acadamic.semister.options(2).text="Third";
			acadamic.semister.options(2).value="Third";
			acadamic.semister.options(3).text="Fourth";
			acadamic.semister.options(3).value="Fourth";
			acadamic.semister.options(4).text="Fifth";
			acadamic.semister.options(4).value="Fifth";
			acadamic.semister.options(5).text="Sixth";
			acadamic.semister.options(5).value="Sixth";
			
	}
}
function IsNumeric(sText)
{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;

   for (i = 0; i < sText.length && IsNumber == true; i++) 
   { 
      Char = sText.charAt(i); 
     if (ValidChars.indexOf(Char) == -1) 
      {
         IsNumber = false;
      }
   }
   return IsNumber;
}
function SetChecked(ch) {
  if(document.f.ch[0].checked){ 
    for( i=0 ; i<document.f.ch.length ; i++) {
		if (document.f.ch[i].name==ch) {
		document.f.ch[i].checked=true;
		}
	}}else{
	 for( i=0 ; i<document.f.ch.length ; i++) {
		if (document.f.ch[i].name==ch) {
		document.f.ch[i].checked=false; 
		}  	}}
}
function check1() {
var flag = false;
  for( i=1 ; i<document.f.ch.length ; i++) {
		if (document.f.ch[i].checked) {
		    document.f.ch[0].checked=true;
		    flag = true;
		    break;
		}
	}
  if(!flag){
	   document.f.ch[0].checked=false; 
	}
}

	