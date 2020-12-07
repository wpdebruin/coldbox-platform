﻿<cfset addAsset('includes/jquery-1.2.6.min.js')>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><cfoutput>#controller.getColdBoxSetting("Codename")# #controller.getColdBoxSetting("Version")#</cfoutput></title>
<link href="includes/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.Titles {
	font:Arial, Helvetica, sans-serif;
	font-size: 15px;
	font-weight: bold;
	color: #00ff00;;
	background-color: #24b8ff;
	padding: 5px 5px 5px 5px;
	height: 30px;
	text-align:center;
}
body{
font:Arial, Helvetica, sans-serif;
font-size: 16px;
}
a {
	font:Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #d2e6bd;
}
a:hover {
	color: #3991fb;
}

-->
</style>
</head>
<body>
<table width="700" border="0" align="center" cellpadding="2" cellspacing="1" style="border: 1px solid #006699">
  <tr class="Titles">
    <td colspan="2" ><cfoutput>Welcome to the #controller.getColdBoxSetting("Codename")# #controller.getColdBoxSetting("Version")# Framework</cfoutput>
    </td>
  </tr>
  <tr>
    <td width="77" height="30" align="center" bgcolor="#eeeeee" valign="top">
    <cfoutput>
    #renderView("navigation")#
    </cfoutput>
    </td>
    <td width="610" valign="top">
	<!--- Render the View Here --->
	<cfoutput>#renderView()#</cfoutput>
	</td>
  </tr>
</table>
<br /><br />
RC:
<cfdump var="#rc#" expand="false" />
</body>
</html>