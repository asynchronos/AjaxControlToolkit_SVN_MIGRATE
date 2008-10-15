// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.

using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

[assembly: System.Web.UI.WebResource("AjaxControlToolkit.ConfirmButton.confirmButtonBehavior.js", "text/javascript")]

namespace AjaxControlToolkit
{
    /// <summary>
    /// ConfirmButton extender class definition
    /// </summary>
    [Designer("AjaxControlToolkit.ConfirmButtonDesigner, AjaxControlToolkit")]
    [ClientScriptResource("AjaxControlToolkit.ConfirmButtonBehavior", "AjaxControlToolkit.ConfirmButton.confirmButtonBehavior.js")]
    [TargetControlType(typeof(IButtonControl))]
    [System.Drawing.ToolboxBitmap(typeof(ConfirmButtonExtender), "ConfirmButton.ConfirmButton.ico")]
    public class ConfirmButtonExtender : ExtenderControlBase
    {
        /// <summary>
        /// OnLoad override
        /// </summary>
        /// <param name="e">event args</param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            // Register an empty OnSubmit statement so the ASP.NET WebForm_OnSubmit method will be automatically
            // created and our behavior will be able to wrap it if necessary
            ScriptManager.RegisterOnSubmitStatement(this, typeof(ConfirmButtonExtender), "ConfirmButtonExtenderOnSubmit", "null;");
        }

        /// <summary>
        /// Text to display in the confirm dialog
        /// </summary>
        [ExtenderControlProperty]
        [RequiredProperty]
        public string ConfirmText
        {
            get
            {
                return GetPropertyValue("ConfirmText", "");
            }
            set
            {
                SetPropertyValue("ConfirmText", value);
            }
        }

        /// <summary>
        /// Gets or sets the client-side script that executes when the cancel button is clicked on the confirm dialog.
        /// </summary>
        [ExtenderControlProperty]
        [DefaultValue("")]
        public string OnClientCancel
        {
            get
            {
                return GetPropertyValue("OnClientCancel", string.Empty);
            }
            set
            {
                SetPropertyValue("OnClientCancel", value);
            }
        }

        /// <summary>
        /// True iff the confirm dialog should run for form submission (i.e., after validators are all satisfied)
        /// </summary>
        [ExtenderControlProperty]
        [DefaultValue(false)]
        public bool ConfirmOnFormSubmit
        {
            get
            {
                return GetPropertyValue<bool>("ConfirmOnFormSubmit", false);
            }
            set
            {
                SetPropertyValue<bool>("ConfirmOnFormSubmit", value);
            }
        }
    }
}
