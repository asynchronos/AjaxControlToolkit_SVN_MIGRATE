<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        LabelLoad.Text = "Loaded at: " + DateTime.Now.ToLongTimeString();
        Label1.Text = "[" + TextBox1.Text + "]";
        Label2.Text = "[" + TextBox2.Text + "]";
        Label3.Text = "[" + TextBox3.Text + "]";
        Label4.Text = "[" + TextBox4.Text + "]";
        Label5.Text = "[" + TextBox5.Text + "]";
        Label6.Text = "[" + TextBox6.Text + "]";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Validation Manual Test Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
    <div>
        <asp:Label ID="LabelLoad" runat="server" />

        <div style="background-color:#eeffee; padding:20px;">
            <asp:TextBox ID="TextBox1" runat="server" />
            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox1" WatermarkText="[watermark]" />
            <asp:Label ID="Label1" runat="server" />
            <hr />
            <asp:TextBox ID="TextBox2" runat="server" />
            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="TextBox2" WatermarkText="[watermark]" />
            <asp:Label ID="Label2" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Must have text." />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Must have text &quot;mark&quot;." ValidationExpression=".*mark.*" />
            <hr />
            <asp:TextBox ID="TextBox3" runat="server" />
            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="TextBox3" WatermarkText="[watermark]" />
            <asp:Label ID="Label3" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must have text." />
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3" />
            <hr />
            <asp:Button ID="Button1" runat="server" Text="Postback" />
            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="Button1" ConfirmText="Postback: Are you sure?" ConfirmOnFormSubmit="true" />
        </div>

        <div style="background-color:#eeeeff; padding:20px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" TargetControlID="TextBox4" WatermarkText="[watermark]" />
                    <asp:Label ID="Label4" runat="server" />
                    <hr />
                    <asp:TextBox ID="TextBox5" runat="server" />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" TargetControlID="TextBox5" WatermarkText="[watermark]" />
                    <asp:Label ID="Label5" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Must have text." />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Must have text &quot;mark&quot;." ValidationExpression=".*mark.*" />
                    <hr />
                    <asp:TextBox ID="TextBox6" runat="server" />
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" TargetControlID="TextBox6" WatermarkText="[watermark]" />
                    <asp:Label ID="Label6" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Must have text." />
                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidator6" />
                    <hr />
                    <asp:Button ID="Button2" runat="server" Text="Async Postback" />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="Button2" ConfirmText="Async Postback: Are you sure?" ConfirmOnFormSubmit="true" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
