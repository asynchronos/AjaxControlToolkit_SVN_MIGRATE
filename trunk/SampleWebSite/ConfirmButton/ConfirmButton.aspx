<%@ Page
    Language="C#"
    MasterPageFile="~/DefaultMaster.master"
    AutoEventWireup="true"
    CodeFile="ConfirmButton.aspx.cs"
    Inherits="ConfirmButton_ConfirmButton"
    Title="ConfirmButton Sample"
    Theme="SampleSiteTheme" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<asp:Content ContentPlaceHolderID="SampleContent" Runat="Server">
<script type='text/javascript'>
    function cancelClick() {
        var label = $get('ctl00_SampleContent_Label1');
        label.innerHTML = 'You hit cancel in the Confirm dialog on ' + (new Date()).localeFormat("T") + '.';
    }
</script>
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <div class="demoarea">
        <div class="demoheading">ConfirmButton Demonstration</div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p>
                    <asp:LinkButton ID="LinkButton" runat="server" OnClick="Button_Click">Click Me</asp:LinkButton>
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
                        TargetControlID="LinkButton"
                        ConfirmText="Are you sure you want to click the LinkButton?" 
                        OnClientCancel="cancelClick" />
                    <br />
                    <br />
                    <asp:Button ID="Button" runat="server" Text="Click Me" OnClick="Button_Click" /><br />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" 
                        TargetControlID="Button"
                        ConfirmText="Are you sure you want to click the Button?" 
                        OnClientCancel="cancelClick" />
                    <br />
                </p>
                <asp:Label ID="Label1" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="demobottom"></div>
    
    <asp:Panel ID="Description_HeaderPanel" runat="server" style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" ImageUrl="~/images/collapse.jpg" AlternateText="collapse" />
            ConfirmButton Description
        </div>
    </asp:Panel>
    <asp:Panel id="Description_ContentPanel" runat="server" style="overflow:hidden;">
        <p>
            ConfirmButton is a simple extender that catches clicks on a button (or any instance of a type 
            derived from Button) and displays a message to the user. If the "OK" button is clicked, the 
            button or link functions normally. If not, the click is trapped and the button will not perform 
            its default submit behavior; optionally, a client script is executed if the OnClientCancel property 
            is set. This is useful for delete links or anything else that requires confirmation from the user.
        </p>
    </asp:Panel>

    <asp:Panel ID="Properties_HeaderPanel" runat="server" style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Properties_ToggleImage" runat="server" ImageUrl="~/images/expand.jpg" AlternateText="expand" />
            ConfirmButton Properties
        </div>
    </asp:Panel>
    <asp:Panel id="Properties_ContentPanel" runat="server" style="overflow:hidden;" Height="0px">
        <p>
            The control above is initialized with this code. The <em>italic</em> properties
            are optional:
        </p>
        <pre>&lt;ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server"
    TargetControlID="LinkButton1" 
    ConfirmText="Are you sure you want to click this?" 
    <em>OnClientCancel</em>="CancelClick" /&gt;</pre>
        <ul>
            <li><strong>TargetControlID</strong> - The ID of the button or link for this extender to operate on.</li>
            <li><strong>ConfirmText</strong> - The text to show when you want to confirm the click.
                (Note: HTML entities can be used here (ex: "&amp;#10;" for new-line))</li>
            <li><strong>OnClientCancel</strong> - The client-side script that executes when the
                cancel button is clicked in the confirm dialog.</li>
            <li><strong>ConfirmOnFormSubmit</strong> - True if the confirm dialog should wait until just before the form submits to display.
            This is useful when ASP.NET validators are in use and the confirm should be shown only after all validators pass.</li>
        </ul>
    </asp:Panel>

    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDescription" runat="Server" 
        TargetControlID="Description_ContentPanel"
        ExpandControlID="Description_HeaderPanel"
        CollapseControlID="Description_HeaderPanel"
        Collapsed="False"        
        ImageControlID="Description_ToggleImage"/>
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeProperties" runat="Server" 
        TargetControlID="Properties_ContentPanel"
        ExpandControlID="Properties_HeaderPanel"
        CollapseControlID="Properties_HeaderPanel"
        Collapsed="True"        
        ImageControlID="Properties_ToggleImage" />
</asp:Content>