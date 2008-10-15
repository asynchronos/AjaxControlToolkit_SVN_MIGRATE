// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web.Resources;
using System.Web.Script;

[assembly: System.Web.UI.WebResource("AjaxControlToolkit.AutoComplete.AutoCompleteBehavior.js", "text/javascript")]
[assembly: System.Web.UI.WebResource("AjaxControlToolkit.PopupControl.PopupControlBehavior.js", "text/javascript")]

namespace AjaxControlToolkit
{
    /// <summary>
    /// Extender that provides suggestions to fill input in a textbox.
    /// </summary>
    [Designer("AjaxControlToolkit.AutoCompleteDesigner, AjaxControlToolkit")]
    [ClientScriptResource("AjaxControlToolkit.AutoCompleteBehavior", "AjaxControlToolkit.AutoComplete.AutoCompleteBehavior.js")]
    [RequiredScript(typeof(CommonToolkitScripts))]
    [RequiredScript(typeof(PopupExtender))]
    [RequiredScript(typeof(TimerScript))]
    [RequiredScript(typeof(AnimationExtender))]
    [TargetControlType(typeof(TextBox))]
    [ToolboxItem("System.Web.UI.Design.WebControlToolboxItem, System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")]
    [ToolboxBitmap(typeof(AutoCompleteExtender), "AutoComplete.AutoComplete.ico")]
    public class AutoCompleteExtender : AnimationExtenderControlBase
    {
        /// <summary>
        /// Minimum length of text before the webservice provides suggestions.
        /// </summary>
        [DefaultValue(3)]
        [ExtenderControlProperty]
        [ClientPropertyName("minimumPrefixLength")]
        public virtual int MinimumPrefixLength
        {
            get { return GetPropertyValue("MinimumPrefixLength", 3); }
            set { SetPropertyValue("MinimumPrefixLength", value); }
        }

        /// <summary>
        /// Time in milliseconds when the timer will kick in to get suggestions using the web service. 
        /// </summary>
        [DefaultValue(1000)]
        [ExtenderControlProperty]
        [ClientPropertyName("completionInterval")]
        public virtual int CompletionInterval
        {
            get { return GetPropertyValue("CompletionInterval", 1000); }
            set { SetPropertyValue("CompletionInterval", value); }
        }

        /// <summary>
        /// Number of suggestions to be provided.
        /// </summary>
        [DefaultValue(10)]
        [ExtenderControlProperty]
        [ClientPropertyName("completionSetCount")]
        public virtual int CompletionSetCount
        {
            get { return GetPropertyValue("CompletionSetCount", 10); }
            set { SetPropertyValue("CompletionSetCount", value); }
        }

        /// <summary>
        /// ID of element that will serve as the completion list.
        /// </summary>
        [DefaultValue("")]
        [ExtenderControlProperty]
        [ClientPropertyName("completionListElementID")]
        [IDReferenceProperty(typeof(WebControl))]
        [Obsolete("Instead of passing in CompletionListElementID, use the default flyout and style that using the CssClass properties.")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1706:ShortAcronymsShouldBeUppercase", MessageId = "Member")]
        public virtual string CompletionListElementID
        {
            get { return GetPropertyValue("CompletionListElementID", String.Empty); }
            set { SetPropertyValue("CompletionListElementID", value); }
        }

        /// <summary>
        /// The web service method to be called.
        /// </summary>
        [DefaultValue("")]
        [RequiredProperty]
        [ExtenderControlProperty]
        [ClientPropertyName("serviceMethod")]
        public virtual string ServiceMethod
        {
            get { return GetPropertyValue("ServiceMethod", String.Empty); }
            set { SetPropertyValue("ServiceMethod", value); }
        }

        /// <summary>
        /// The path to the web service that the extender will pull the 
        /// word\sentence completions from. If this is not provided, the 
        /// service method should be a page method. 
        /// </summary>
        [UrlProperty]
        [ExtenderControlProperty]
        [TypeConverter(typeof(ServicePathConverter))]
        [ClientPropertyName("servicePath")]
        public virtual string ServicePath
        {
            get { return GetPropertyValue("ServicePath", String.Empty); }
            set { SetPropertyValue("ServicePath", value); }
        }

        /// <summary>
        /// User/page specific context provided to an optional overload of the
        /// web method described by ServiceMethod/ServicePath.  If the context
        /// key is used, it should have the same signature with an additional
        /// parameter named contextKey of type string.
        /// </summary>
        [ExtenderControlProperty]
        [ClientPropertyName("contextKey")]
        [DefaultValue(null)]
        public string ContextKey
        {
            get { return GetPropertyValue<string>("ContextKey", null); }
            set
            {
                SetPropertyValue<string>("ContextKey", value);
                UseContextKey = true;
            }
        }

        /// <summary>
        /// Whether or not the ContextKey property should be used.  This will be
        /// automatically enabled if the ContextKey property is ever set
        /// (on either the client or the server).  If the context key is used,
        /// it should have the same signature with an additional parameter
        /// named contextKey of type string.
        /// </summary>
        [ExtenderControlProperty]
        [ClientPropertyName("useContextKey")]
        [DefaultValue(false)]
        public bool UseContextKey
        {
            get { return GetPropertyValue<bool>("UseContextKey", false); }
            set { SetPropertyValue<bool>("UseContextKey", value); }
        }

        /// <summary>
        /// Css Class that will be used to style the completion list flyout.
        /// </summary>
        [DefaultValue("")]
        [ExtenderControlProperty]
        [ClientPropertyName("completionListCssClass")]
        public string CompletionListCssClass
        {
            get { return GetPropertyValue("CompletionListCssClass", ""); }
            set { SetPropertyValue("CompletionListCssClass", value); }
        }

        /// <summary>
        /// Css Class that will be used to style an item in the autocomplete list.
        /// </summary>
        [DefaultValue("")]
        [ExtenderControlProperty]
        [ClientPropertyName("completionListItemCssClass")]
        public string CompletionListItemCssClass
        {
            get { return GetPropertyValue("CompletionListItemCssClass", ""); }
            set { SetPropertyValue("CompletionListItemCssClass", value); }
        }

        /// <summary>
        /// Css Class that will be used to style a highlighted item in the autocomplete list.
        /// </summary>
        [DefaultValue("")]
        [ExtenderControlProperty]
        [ClientPropertyName("highlightedItemCssClass")]
        public string CompletionListHighlightedItemCssClass
        {
            get { return GetPropertyValue("CompletionListHighlightedItemCssClass", ""); }
            set { SetPropertyValue("CompletionListHighlightedItemCssClass", value); }
        }

        /// <summary>
        /// Flag to denote whether client side caching is enabled.
        /// </summary>
        [DefaultValue(true)]
        [ExtenderControlProperty]
        [ClientPropertyName("enableCaching")]
        public virtual bool EnableCaching
        {
            get { return GetPropertyValue("EnableCaching", true); }
            set { SetPropertyValue("EnableCaching", value); }
        }
        /// <summary>
        /// Gets or sets the character(s) used to separate words for autocomplete.
        /// </summary>
        [ExtenderControlProperty]
        [ClientPropertyName("delimiterCharacters")]
        public virtual string DelimiterCharacters
        {
            get { return GetPropertyValue("DelimiterCharacters", String.Empty); }
            set { SetPropertyValue("DelimiterCharacters", value); }
        }

        /// <summary>
        /// Determines if the First Row of the Search Results be selected by default
        /// </summary>
        [DefaultValue(false)]
        [ExtenderControlProperty]
        [ClientPropertyName("firstRowSelected")]
        public virtual bool FirstRowSelected
        {
            get { return GetPropertyValue("FirstRowSelected", false); }
            set { SetPropertyValue("FirstRowSelected", value); }
        }

        /// <summary>
        /// OnShow animation
        /// </summary>
        [ExtenderControlProperty]
        [ClientPropertyName("onShow")]
        [Browsable(false)]
        [DefaultValue(null)]
        public Animation OnShow
        {
            get { return GetAnimation(ref _onShow, "OnShow"); }
            set { SetAnimation(ref _onShow, "OnShow", value); }
        }
        private Animation _onShow;

        /// <summary>
        /// Don't serialize OnShow in the designer
        /// </summary>
        /// <returns>Whether we should serialize</returns>
        [EditorBrowsable(EditorBrowsableState.Never)]
        public bool ShouldSerializeOnShow()
        {
            return !DesignMode;
        }

        /// <summary>
        /// OnHide animation
        /// </summary>
        [ExtenderControlProperty]
        [ClientPropertyName("onHide")]
        [Browsable(false)]
        [DefaultValue(null)]
        public Animation OnHide
        {
            get { return GetAnimation(ref _onHide, "OnHide"); }
            set { SetAnimation(ref _onHide, "OnHide", value); }
        }
        private Animation _onHide;

        /// <summary>
        /// Don't serialize OnHide in the designer
        /// </summary>
        /// <returns>Whether we should serialize</returns>
        [EditorBrowsable(EditorBrowsableState.Never)]
        public bool ShouldSerializeOnHide()
        {
            return !DesignMode;
        }

        /// <summary>
        /// Convert server IDs into ClientIDs for animations
        /// </summary>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            ResolveControlIDs(_onShow);
            ResolveControlIDs(_onHide);
        }
    }
}