using System.Web.UI;
using BVSoftware.Commerce.Catalog;
using BVSoftware.Commerce.Content;
using System.Collections.Generic;

namespace BVCommerce
{

    partial class BVModules_Controls_AdditionalImages : BVSoftware.Commerce.Content.BVUserControl
    {

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                ThemeManager themes = MyPage.BVApp.ThemeManager();
                this.imgZoom.ImageUrl = themes.ButtonUrl("MorePictures", Request.IsSecureConnection);
            }

            string id = Request.QueryString["ProductID"];
            this.ZoomLink.Style.Add("CURSOR", "pointer");
            this.ZoomLink.Attributes.Add("onclick", ViewUtilities.GetAdditionalImagesPopupJavascript(id, this.Page));

            Product baseProd = MyPage.BVApp.CatalogServices.Products.Find(id);
            if (baseProd != null)
            {
                List<ProductImage> images = MyPage.BVApp.CatalogServices.ProductImages.FindByProductId(baseProd.Bvin);

                if (images.Count <= 0)
                {
                    this.ZoomLink.Visible = false;
                }
            }

        }

    }
}