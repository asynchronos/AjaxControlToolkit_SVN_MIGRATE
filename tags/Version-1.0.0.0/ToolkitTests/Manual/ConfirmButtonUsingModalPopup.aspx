<%@ Page Language="C#" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        LBL.Text = DateTime.Now.ToLongTimeString();
        TBL1.Text = TB1.Text;
        TBL2.Text = TB2.Text;
    }

    protected void BTN_Click(object sender, EventArgs e)
    {
        LBL.BackColor = System.Drawing.Color.Lime;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
    .background { background-color:Gray; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:ScriptManager ID="SM" runat="server" />
<%--
        <asp:UpdatePanel ID="UP" runat="server">
        <ContentTemplate>
--%>
        <asp:Label ID="LBL" runat="server" />
        <br />

        <asp:Button ID="BTN" runat="server" Text="Submit" OnClick="BTN_Click" />
        <%--<asp:Button ID="BTN" runat="server" Text="Submit" UseSubmitBehavior="false" />--%>

        <ajaxToolkit:ModalPopupExtender ID="MPE" runat="server" TargetControlID="BTN" PopupControlID="PNL" OkControlID="OK" CancelControlID="CAN" BackgroundCssClass="background" />

        <%--<ajaxToolkit:ConfirmButtonExtender ID="CBE" runat="server" TargetControlID="BTN" ConfirmText="Are you sure?" OnClientCancel="OnClientCancel" DisplayModalPopupID="MPE" />--%>
        <ajaxToolkit:ConfirmButtonExtender ID="CBE" runat="server" TargetControlID="BTN" ConfirmText="Really?" OnClientCancel="OnClientCancel" DisplayModalPopupID="MPE" ConfirmOnFormSubmit="true" />

        <asp:Panel ID="PNL" runat="server" style="display:none; background-color:White; border-width:2px; border-color:Black; border-style:solid; padding:10px;">
            Are you sure?
            <br />
            <asp:Button ID="OK" runat="server" Text="OK" />
            <asp:Button ID="CAN" runat="server" Text="CANCEL" />
        </asp:Panel>

        <script type="text/javascript">
            function OnClientCancel() {
                alert('OnClientCancel');
            }
        </script>

        <br />
        <asp:TextBox ID="TB1" runat="server" />
        <ajaxToolkit:TextBoxWatermarkExtender ID="TBW1" runat="server" TargetControlID="TB1" WatermarkText="[watermark]" />
        <asp:Label ID="TBL1" runat="server" />
        <br />
        <asp:TextBox ID="TB2" runat="server" />
        <ajaxToolkit:TextBoxWatermarkExtender ID="TBW2" runat="server" TargetControlID="TB2" WatermarkText="[watermark]" />
        <asp:Label ID="TBL2" runat="server" />
        <asp:RequiredFieldValidator ID="RFV" runat="server" ControlToValidate="TB2" ErrorMessage="Need text content" />
<%--
        </ContentTemplate>
        </asp:UpdatePanel>
--%>
        </div>
    </form>
</body>
</html>
