<%@ Page Language="vb" AutoEventWireup="false" Codebehind="exm.aspx.vb" Inherits="e_testweb.exm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ШАЛГАЛТЫН ЦОНХ</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="stylesss.css" rel="stylesheet" type="text/css">
		<SCRIPT language="JavaScript">
document.onmousedown=DE98k847;document.onkeypress=QcV822a4;document.onselectstart=UL4Q7a4P;
function DE98k847(){if ((event.button == 2) || (event.button == 3)){return XGF33542();};if ((event.button == 1) && ((event.ctrlKey) ||(event.shiftKey))){return XGF33542(true);};return true;};
function QcV822a4(){if (event.KeyCode == 0)return XGF33542();};
function UL4Q7a4P(){return XGF33542();};
function XGF33542(pa86RFK5){var kb9957Gb = "© Уучлаарай та буруу vйлдэл хийлээ. OK товч дээр дарна уу." ;if(event)event.cancelBuble = true;if (pa86RFK5){alert(kb9957Gb);}else{alert(kb9957Gb);};return false;};</SCRIPT>
	</HEAD>
	<body MS_POSITIONING="GridLayout" onload="setInterval(&quot;window.clipboardData.setData('text','')&quot;,20)">
		<SCRIPT>
var vari = "";
function stttimer()
{   vari = window.setInterval("hugatsaa()",1000);
} 
function stptimer()
{   window.clearInterval (vari);
    vari="";
}
function hugatsaa()
{   
    var too = Math.round(t/60)
    if (too>t/60) too--;
    document.chk.monitoring.value = too+":"+(t%60);
    if (--t == -1)
    {    stptimer();
         location.href="result.aspx";   
    }    
}

window.name = "currentWindowName";
var newWin;
var newWin2;

function popUp(page, name, details) {
newWin=window.open(page, name, details);
return false;
}
function popUp2(page, name, details) {
newWin=window.open(page, name, details);
newWin.focus();
return false;
 }
		</SCRIPT>
		<form name="chk">
			<INPUT id="tsag" style="Z-INDEX: 104; LEFT: 16px; WIDTH: 64px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="text" size="5" name="monitoring">
		</form>
		<script>stttimer();</script>
		<form id="Form1" method="post" runat="server">
			<asp:linkbutton id="lnknext" style="Z-INDEX: 115; LEFT: 80px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="56px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">дараах >></asp:linkbutton><asp:label id="Label5" style="Z-INDEX: 113; LEFT: 144px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="WhiteSmoke" Height="16px" Width="200px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">Нийт 450 асуултаас</asp:label><asp:imagebutton id="btnInfo" style="Z-INDEX: 112; LEFT: 648px; POSITION: absolute; TOP: 16px" runat="server"
				Height="48px" Width="48px" ImageUrl=".\mini\to_student.gif"></asp:imagebutton><asp:label id="Label4" style="Z-INDEX: 111; LEFT: 632px; POSITION: absolute; TOP: 72px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="96px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">Багшын мэдээлэл</asp:label><asp:label id="Label3" style="Z-INDEX: 110; LEFT: 856px; POSITION: absolute; TOP: 72px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="86px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">Шалгалт дvгнэх</asp:label><asp:label id="Label2" style="Z-INDEX: 109; LEFT: 744px; POSITION: absolute; TOP: 72px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="88px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040">Багшид мэдээлэх</asp:label><asp:imagebutton id="btngrade" style="Z-INDEX: 108; LEFT: 872px; POSITION: absolute; TOP: 16px" runat="server"
				Height="48px" Width="48px" ImageUrl=".\mini\result.gif"></asp:imagebutton><asp:label id="Label10" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="WhiteSmoke" Height="112px" Width="940px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" ForeColor="WhiteSmoke"></asp:label><asp:panel id="pnl" style="Z-INDEX: 105; LEFT: 8px; POSITION: absolute; TOP: 128px" runat="server"
				Height="296px" Width="940px" Font-Size="10pt" Font-Names="Tahoma"></asp:panel><asp:panel id="Panel1" style="Z-INDEX: 106; LEFT: 800px; POSITION: absolute; TOP: 432px" runat="server"
				Height="32px" Width="148px" Font-Size="10pt" Font-Names="Tahoma"></asp:panel><asp:imagebutton id="Btnmedee" style="Z-INDEX: 107; LEFT: 760px; POSITION: absolute; TOP: 16px" runat="server"
				Height="48px" Width="48px" ImageUrl=".\mini\info_sent.gif"></asp:imagebutton><asp:linkbutton id="lnkprev" style="Z-INDEX: 114; LEFT: 16px; POSITION: absolute; TOP: 96px" runat="server"
				BackColor="WhiteSmoke" Height="8px" Width="56px" Font-Size="8pt" Font-Names="Tahoma" ForeColor="#404040"><< емнех</asp:linkbutton><asp:label id="Label7" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 88px" runat="server"
				BackColor="WhiteSmoke" Height="32px" Width="940px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" ForeColor="WhiteSmoke"></asp:label><asp:label id="Label1" style="Z-INDEX: 101; LEFT: 936px; POSITION: absolute; TOP: 16px" runat="server"
				Height="24px" Width="8px" Visible="False">"</asp:label></form>
	</body>
</HTML>
