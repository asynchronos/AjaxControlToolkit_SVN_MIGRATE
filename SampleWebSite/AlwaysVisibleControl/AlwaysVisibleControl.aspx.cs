// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.


using System;
using AjaxControlToolkit;

public partial class AlwaysVisibleControl_AlwaysVisibleControl : CommonPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Because we use JavaScript to set the time and we're using an update
        // panel, refreshes cause the display to be blank until the next javascript
        // event fires.  To prevent it from not showing up, we'll always set it here
        // as well and let JavaScript overwrite it
        currentTime.InnerText = DateTime.Now.ToString("T");

        // Don't initially hook up the extender
        if (!IsPostBack)
            avce.Enabled = false;
    }

    /// <summary>
    /// Update properties of the extender
    /// </summary>
    protected void OnChange(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ddlPosition.SelectedValue) || ddlPosition.SelectedValue.Length != 2)
        {
            avce.Enabled = false;
            return;
        }

        avce.Enabled = true;
        switch (ddlPosition.SelectedValue[0])
        {
            case 'T' :
                avce.VerticalSide = VerticalSide.Top;
                break;
            case 'M' :
                avce.VerticalSide = VerticalSide.Middle;
                break;
            case 'B' :
                avce.VerticalSide = VerticalSide.Bottom;
                break;
            default:
                avce.Enabled = false;
                return;
        }

        switch (ddlPosition.SelectedValue[1])
        {
            case 'L':
                avce.HorizontalSide = HorizontalSide.Left;
                break;
            case 'C':
                avce.HorizontalSide = HorizontalSide.Center;
                break;
            case 'R':
                avce.HorizontalSide = HorizontalSide.Right;
                break;
            default:
                avce.Enabled = false;
                return;
        }
    }
}