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
        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
        Check the stars to see how mutually exclusive extender and toggle button work together.
        The stars cannot be both filled at any time.<br /><br />
        <asp:CheckBox ID="CheckBox1" runat="server" />
        <br /><br />
        <asp:CheckBox ID="CheckBox2" runat="server" />
        <ajaxToolkit:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1"
            runat="server" TargetControlID="CheckBox1" Key="check">
        </ajaxToolkit:MutuallyExclusiveCheckBoxExtender>
        <ajaxToolkit:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender2"
            runat="server" TargetControlID="CheckBox2" Key="check">
        </ajaxToolkit:MutuallyExclusiveCheckBoxExtender>
    </div>
        <ajaxToolkit:ToggleButtonExtender ID="ToggleButtonExtender1" 
        runat="server" TargetControlID="CheckBox1" 
        UncheckedImageUrl="../Images/EmptyStar.png" 
        CheckedImageUrl="../Images/FilledStar.png" ImageWidth="30" ImageHeight="30">
        </ajaxToolkit:ToggleButtonExtender>
        
         <ajaxToolkit:ToggleButtonExtender ID="ToggleButtonExtender2" 
        runat="server" TargetControlID="CheckBox2" 
        UncheckedImageUrl="../Images/EmptyStar.png" 
        CheckedImageUrl="../Images/FilledStar.png" ImageWidth="30" ImageHeight="30">
        </ajaxToolkit:ToggleButtonExtender>
    </form>
</body>
</html>
