<%@ Page Language="C#" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" EnableScriptLocalization="true" EnableScriptGlobalization="true" runat="server" />

<p>


<asp:Label runat="server" AssociatedControlID="txtDate" ID="Label2" Text="Date"></asp:Label> 

<asp:TextBox runat="server" ID="txtDate" ReadOnly="True"></asp:TextBox> 

<asp:Image ID="imgCal" runat="server" ImageUrl="~/Images/Calendar_scheduleHS.png" /> 

<ajaxToolkit:CalendarExtender ID="ceDate" runat="server" TargetControlID="txtDate" PopupButtonID="imgCal"> 

</ajaxToolkit:CalendarExtender> 

</p> 
 
    
    </div>
    </form>
</body>
</html>
