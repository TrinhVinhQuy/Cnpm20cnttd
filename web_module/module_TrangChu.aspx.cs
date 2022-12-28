using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_TrangChu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Request.Cookies["UserNameWeb"] == null)
        //    {
        //        Response.Redirect("/dang-nhap");
        //    }

        //}
        var getSl = from sl in db.tbSlides
                    select new
                    {
                        sl.slide_id,
                        sl.slide_image,
                        sl.slide_title,
                        sl.slide_title1,
                    };
        rpSlide.DataSource = getSl;
        rpSlide.DataBind();

        var getPR = from pr in db.tbProducts
                    select new
                    {
                        pr.product_id,
                        pr.product_title,
                        pr.product_image,
                        pr.product_price,
                        pr.product_promotions,
                        product_price_new = pr.product_price * (100 + pr.product_promotions) / 100,
                    };
        rpProduct.DataSource = getPR;
        rpProduct.DataBind();
        rpFeaturedProduct.DataSource = getPR;
        rpFeaturedProduct.DataBind();
    }
}