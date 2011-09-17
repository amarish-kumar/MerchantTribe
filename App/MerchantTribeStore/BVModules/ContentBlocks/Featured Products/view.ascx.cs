using System.Collections.Generic;
using System.Text;
using BVSoftware.Commerce.Catalog;
using BVSoftware.Commerce.Content;

namespace BVCommerce
{

    partial class BVModules_ContentBlocks_Featured_Products_view : BVModule
    {
        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);
            LoadProductGrid();
        }

        private void LoadProductGrid()
        {

            List<Product> displayProducts = null;
            displayProducts = MyPage.BVApp.CatalogServices.Products.FindFeatured(1,100);

            if ((displayProducts == null))
            {
                this.litMain.Text = string.Empty;
                return;
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("<div class=\"featuredproducts\">");
            foreach (Product p in displayProducts)
            {
                UserSpecificPrice price = MyPage.BVApp.PriceProduct(p, MyPage.BVApp.CurrentCustomer, null);
                BVSoftware.Commerce.Utilities.HtmlRendering.RenderSingleProduct(ref sb, p, false, false, this.Page, price);
            }
            sb.Append("<div class=\"clear\"></div></div>");

            this.litMain.Text = sb.ToString();
        }

    }
}