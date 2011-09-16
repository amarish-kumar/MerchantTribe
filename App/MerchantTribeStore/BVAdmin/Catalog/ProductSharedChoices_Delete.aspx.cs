using System.Web.UI;
using BVSoftware.Commerce.Catalog;

namespace BVCommerce
{

    partial class BVAdmin_Catalog_ProductSharedChoices_Delete : BaseAdminJsonPage
    {

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            if (!Page.IsPostBack)
            {
                string ChoiceId = Request.Form["id"];
                Delete(ChoiceId);
                string Redirect = Request.Form["redirect"];
                if ((Redirect == "1") | (Redirect == "y"))
                {
                    Response.Redirect("ProductSharedChoices.aspx");
                }
            }
        }

        private void Delete(string id)
        {
            Option opt = BVApp.CatalogServices.ProductOptions.Find(id);
            if ((opt != null))
            {

                // Make sure we update any products that have this assigned so that
                // variants make sense.
                BVApp.CatalogServices.ValidateVariantsForSharedOption(opt);

                if ((BVApp.CatalogServices.ProductOptions.Delete(id)))
                {
                    this.litOutput.Text = "{\"result\":true}";
                }

            }

            this.litOutput.Text = "{\"result\":false}";
        }

    }
}