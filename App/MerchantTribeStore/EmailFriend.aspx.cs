using System;
using System.Web.UI;
using BVSoftware.Commerce;
using BVSoftware.Commerce.Catalog;
using BVSoftware.Commerce.Content;
using BVSoftware.Commerce.Membership;
using BVSoftware.Commerce.Utilities;

namespace BVCommerce
{

    partial class EmailFriend : BaseStorePage
    {

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {

                btnSend.ImageUrl = this.BVApp.ThemeManager().ButtonUrl("Submit", Request.IsSecureConnection);

                inMessage.Text = "<a href=\"" + Request.Params["page"] + "\">" + Request.Params["page"] + "</a>";

                if (SessionManager.IsUserAuthenticated(this.BVApp) == true)
                {

                    CustomerAccount u = BVApp.CurrentCustomer;

                    this.FromEmailField.Text = u.Email;
                }

                this.pnlMain.Visible = true;
                this.pnlRegister.Visible = false;

                //Me.valEmail.Text = ImageHelper.GetErrorIconTag
                //Me.valEmail2.Text = ImageHelper.GetErrorIconTag
                //Me.Requiredfieldvalidator1.Text = ImageHelper.GetErrorIconTag
                //Me.Regularexpressionvalidator1.Text = ImageHelper.GetErrorIconTag
            }
        }

        protected void btnSend_OnClick(object Sender, ImageClickEventArgs E)
        {
            lblErrorMessage.Visible = false;
            lblErrorMessage.Text = "";
            lblResults.Text = "";
            string f = string.Empty;

            Product p;
            p = BVApp.CatalogServices.Products.Find(Request.QueryString["productID"]);

            HtmlTemplate t = BVApp.ContentServices.GetHtmlTemplateOrDefault(HtmlTemplateType.EmailFriend);

            if (t != null)
            {

                System.Net.Mail.MailMessage m;
                t = t.ReplaceTagsInTemplate(BVApp, p);
                t.From = this.FromEmailField.Text.Trim();
                m = t.ConvertToMailMessage(this.toEmailField.Text.Trim());

                if (MailServices.SendMail(m) == false)
                {
                    lblErrorMessage.Text = "Error while sending mail!";
                    lblErrorMessage.Visible = true;
                }
                else
                {
                    lblResults.Text = "Thank you.  Your message has been sent.";
                }

            }

        }

    }
}