
function toconvert()
{
var sourceareastr = document.board.sourcearea.value;
var strlen = sourceareastr.length;
document.board.sourcearea.value="";
var str="";
for (i = 0; i < strlen;  i++) { 
	var codestr = sourceareastr.charCodeAt(i);
	   switch(codestr) {
		case 184: codestr=1105;break; //eo
		case 168: codestr=1025;break; // capital EO
	
		case 175: codestr=86; break; //capital UE
		case 191: codestr=118; break; //ue
		
		case 170: codestr=1028; break; // capital OE
		case 186: codestr=1108; break; //oe
	   }
	   if (256>codestr && codestr>191) codestr=codestr+848;
	   switch(codestr) {
		case 1111: codestr=118;break;   //u
		case 1031: codestr= 86; break; //capital U
		
		case 1108: codestr=1108; break; //ou
		case 1028: codestr=1028; break; //capital OU
	   }
           str=str+String.fromCharCode(codestr);
      } 
   document.board.sourcearea.value=str;   
}

