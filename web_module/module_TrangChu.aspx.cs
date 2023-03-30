using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getSlide = from sl in db.tbSlides
                       select sl;
        rpSlide.DataSource = getSlide.Take(1);
        rpSlide.DataBind();
        rpSlide1.DataSource = getSlide.Skip(1);
        rpSlide1.DataBind();
        /*Tạo ra list danh sách với các điều kiện truy vấn*/
        var getEGA = (from prc in db.tbProductCates
                      select new
                      {
                          prc.productcate_id,
                          prc.productcate_title,
                          prc.meta_image,
                          soluong = (from pr in db.tbProducts
                                     where pr.product_id == prc.productcate_id
                                     select pr).Count(),
                      }).Take(6);
        rpThoiTrangEGA.DataSource = getEGA; // truyền data từ list lên Repeater
        rpThoiTrangEGA.DataBind(); // đổ data lên web

        var getDoHieu = (from pr in db.tbProducts
                         join ct in db.tbCities on Convert.ToInt32(pr.h1_seo) equals ct.city_id
                         where pr.productcate_id == 6
                         orderby pr.product_id descending
                         select new
                         {
                             pr.product_id,
                             pr.product_image,
                             pr.product_title,
                             ct.city_name,
                             pr.product_price_new,
                             pr.product_price,
                         }).Take(4);
        rpDoHieu.DataSource = getDoHieu;
        rpDoHieu.DataBind();
        var getTheThao = (from pr in db.tbProducts
                          join ct in db.tbCities on Convert.ToInt32(pr.h1_seo) equals ct.city_id
                          where pr.productcate_id == 8
                          orderby pr.product_id descending
                          select new
                          {
                              pr.product_id,
                              pr.product_image,
                              pr.product_title,
                              ct.city_name,
                              pr.product_price_new,
                              pr.product_price,
                          }).Take(8);
        rpDoTheThao.DataSource = getTheThao;
        rpDoTheThao.DataBind();
        var getAoSoMi = (from pr in db.tbProducts
                         join ct in db.tbCities on Convert.ToInt32(pr.h1_seo) equals ct.city_id
                         where pr.productcate_id == 11
                         orderby pr.product_id descending
                         select new
                         {
                             pr.product_id,
                             pr.product_image,
                             pr.product_title,
                             ct.city_name,
                             pr.product_price_new,
                             pr.product_price,
                         }).Take(4);
        rpAoSoMi.DataSource = getAoSoMi;
        rpAoSoMi.DataBind();
    }
}