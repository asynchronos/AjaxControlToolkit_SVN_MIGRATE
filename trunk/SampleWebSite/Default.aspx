<%@ Page Language="C#" MasterPageFile="~/DefaultMaster.master" AutoEventWireup="true"
    Inherits="CommonPage" Title="ASP.NET AJAX Control Toolkit" %>

<asp:Content ContentPlaceHolderID="SampleContent" runat="Server">
    <p>
        Welcome to the ASP.NET AJAX Control Toolkit sample website. Please choose from any
        of the samples on the left.
    </p>
    <br />
    <p>
        <strong><u>Installation Files</u></strong></p>
    <br />
    <p>
        Please visit the
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="http://www.codeplex.com/Wiki/View.aspx?ProjectName=AtlasControlToolkit">AJAX Control Toolkit Project Page</asp:HyperLink>
        on CodePlex</p>
    <br />    
    <p>
        <strong><u>Release Notes</u></strong></p>
    <br />
    <p>
        <u><strong>Version 1.0.10618.0</strong></u> - <em>Requires ASP.NET AJAX version 1.0</em></p>
    <p>
        This is a refresh release that fixes some of the issues discovered in the 1.0.10606.0 
        release.  
    </p>
    <br />
    <p><strong>General fixes:</strong></p>
    <ul class="releaseList">
        <li><strong>Tabs: </strong>Resolved NamingContainer issues so that FindControl works as expected in Tabs.</li>
        <li><strong>ToolkitScriptManager: </strong>Shorter combined script URLs and new HTTP handler support 
            for generation of combined script files.</li>
        <li><strong>Dependencies: </strong>Removed explicit reference to VsWebSite.Interop.dll and stdole.dll.
            They will not be automatically included in the web configuration files by Visual Studio.</li>
        <li><strong>FilteredTextBox: </strong> Navigation, Control and Delete keys work fine in all browsers.</li>
        <li><strong>Localization: </strong> Turkish, Dutch, and Traditional and Simplified Chinese language support added.</li>        
    </ul>
    <br /><p>
        Breaking Changes:</p>
    <p>
    </p>
    <ul class="releaseList">
        <li>No breaking changes</li>
    </ul>
    <p>
    </p>
    <p>
        Known Issues:</p>
    <p>
    </p>
    <ul class="releaseList">
        <li>No new issues</li>
    </ul>
    <br /><br />
    <u><strong>Version 1.0.10606.0</strong></u> - <em>Requires ASP.NET AJAX version 1.0</em></p>
    <br />
    <p><strong>General fixes:</strong></p>
    <ul class="releaseList">
        <li><strong>Design Mode support:</strong>
            <ul>
                <li><strong>Tabs designer:</strong> Tabs control can be configured in the designer.</li>
                <li><strong>PageMethods in code-behind:</strong> Extenders that consume web services
                    can now have PageMethods added to code-behind automatically when using
                    the designer. A repair mode fixes existing PageMethods with incorrect signatures.</li>
                <li><strong>Control icons:</strong> Toolkit controls have more meaningful icons that
                    show up in the Visual Studio Toolbox when the Toolkit DLL is added to it.</li>
            </ul>
        </li>
        <li><strong>Dynamic context:</strong> Toolkit extenders that consume web services can
            now pass additional context beyond what is used by the default web service
            signature.</li>
        <li><strong>Validators and Toolkit extenders:</strong> Extenders that target TextBoxes
            with ASP.NET validators attached to them no longer interfere with the validation process.</li>
        <li><strong>Animation support:</strong> Toolkit controls that build on top of PopupBehavior
            now have generic animation support built in.</li>
        <li><strong>Script combiner:</strong> When the <a href="Walkthrough/OtherNeatStuff.aspx">ToolkitScriptManager</a> is used,
            Toolkit scripts are downloaded in a single, common JavaScript file instead of multiple files. This allows for
            faster downloads and fewer roundtrips. The combined file is generated dynamically
            depending on the controls being used on the page. All Toolkit sample pages use this new functionality.</li>
        <li><strong>Events support:</strong> Toolkit controls fire events for core actions.
            This is in part to make plugging in animation easier and also to allow users to
            hook into the various Toolkit controls' behaviors and perform custom actions.</li>
        <li><strong>Bug fixes:</strong> This <a href="http://www.codeplex.com/AtlasControlToolkit/Release/ProjectReleases.aspx?ReleaseId=1813">
            release</a> includes fixes for over <strong>120 issues</strong> tracked in the Toolkit
            Issue Tracker representing over <strong>750 user votes</strong>.</li>
        <li><strong>Accessibility fixes:</strong> Slider and AutoComplete have support for high
            contrast and some controls like AutoComplete, NumericUpDown, CascadingDropDown and
            DynamicPopulate which issue XmlHttpRequests update a hidden DOM element to <a href="http://juicystudio.com/article/improving-ajax-applications-for-jaws-users.php">
                automatically refresh the JAWS screen buffer</a> to reflect new data.</li>
    </ul>
    <br />
    <p><strong>Control updates:</strong></p>
    <ul>
        <li><strong>MaskedEdit</strong> extender works well with the Calendar extender and the
            ValidatorCallout extender when targeting the same TextBox.</li>
        <li><strong>AutoComplete</strong> supports scrolling in the fly-out, multi-word, first
            word default selection and it has animation built into it.</li>
        <li><strong>ModalPopup</strong> fix for most common scenarios involving absolute and relative positioning.</li>
        <li><strong>NumericUpDown</strong> has new Minimum and Maximum properties to restrict
            the range of numbers allowed.</li>
    </ul>
    <p>
    </p><br />
    <p><strong>Visual Studio Codename "Orcas" support:</strong></p>
        <ul>
            <li>The Toolkit DLL works with ASP.NET AJAX Orcas Beta 1 DLLs and there are no breaking changes.</li>
        </ul>
    <br />
    <p>
        Breaking Changes:</p>
    <p>
    </p>
    <ul class="releaseList">
        <li>No breaking changes</li>
    </ul>
    <p>
    </p>
    <p>
        Known Issues:</p>
    <p>
    </p>
    <ul class="releaseList">
        <li>No new issues</li>
    </ul>
    <br />
    <br />
    Link to Toolkit release <a href="ArchivedReleases.aspx">archive</a>.
</asp:Content>
