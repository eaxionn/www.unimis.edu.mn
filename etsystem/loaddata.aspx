<%@ Page Language="vb" AutoEventWireup="false" Codebehind="loaddata.aspx.vb" Inherits="e_testweb.loaddata" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>јчааллах</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<SCRIPT>
var vari = "";
var t = 1;

function stttimer()
{
    vari = window.setInterval("hugatsaa()",1000);
} 
function stptimer()
{
    window.clearInterval(vari);
    vari="";
}
function hugatsaa()
{   
    var c = Math.round(t/60)
    if (--t == -1)
    {
        stptimer();
        window.close();
    }
}
		</SCRIPT>
		<script>stttimer();</script>
		<form id="Form1" method="post" runat="server">
			<asp:Image id="Image1" style="Z-INDEX: 101; LEFT: 80px; POSITION: absolute; TOP: 24px" runat="server"
				Width="57px" Height="60px" ImageUrl=".\mini\load_pic_dues.gif"></asp:Image>
			<asp:Label id="Label1" style="Z-INDEX: 102; LEFT: 16px; POSITION: absolute; TOP: 88px" runat="server"
				Width="192px" Height="8px" Font-Names="Tahoma" Font-Size="10pt">«ураг, јсуултуудыг хайж байна.</asp:Label>
			<asp:Panel id="Panel1" style="Z-INDEX: 103; LEFT: 8px; POSITION: absolute; TOP: 152px" runat="server"
				Width="208px" Height="120px">Panel</asp:Panel>
		</form>
	</body>
</HTML>
