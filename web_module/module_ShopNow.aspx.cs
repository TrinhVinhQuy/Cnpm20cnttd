using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ShopNow : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getPR_nam = from pr in db.tbProducts
                        where pr.productcate_id == 7
                        select new
                        {
                            pr.product_id,
                            pr.product_title,
                            pr.product_image,
                            product_price_new = pr.product_price * (100 + pr.product_promotions) / 100,
                            pr.product_price,
                            pr.product_promotions,
                        };
        rpProduct_nam.DataSource = getPR_nam;
        rpProduct_nam.DataBind();
        var getPR_nu = from pr in db.tbProducts
                       where pr.productcate_id == 6
                       select new
                       {
                           pr.product_id,
                           pr.product_title,
                           pr.product_image,
                           product_price_new = pr.product_price * (100 + pr.product_promotions) / 100,
                           pr.product_price,
                           pr.product_promotions,
                       };
        rpProduct_nu.DataSource = getPR_nu;
        rpProduct_nu.DataBind();
        var getPR_tre = from pr in db.tbProducts
                        where pr.productcate_id == 8
                        select new
                        {
                            pr.product_id,
                            pr.product_title,
                            pr.product_image,
                            product_price_new = pr.product_price * (100 + pr.product_promotions) / 100,
                            pr.product_price,
                            pr.product_promotions,
                        };
        rpProduct_tre.DataSource = getPR_tre;
        rpProduct_tre.DataBind();
    }

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        //Request.Cookies["UserNameWeb"].Value 
        var idkhach = (from kh in db.tbCustomerAccounts
                       where kh.customer_user == Request.Cookies["UserNameWeb"].Value
                       select kh).FirstOrDefault().customer_id;
        var getDonHang = (from hd in db.tbHoaDonBanHangs
                          where hd.khachhang_id == idkhach
                          && hd.hoadon_tinhtrang == "chua"
                          select hd);
        string[] arrId = txtId.Value.Split(';');
        if (getDonHang.Count() > 0)
        {
            for (int i = 0; i < arrId.Length; i++)
            {
                tbHoaDonBanHangChiTiet insertHD = new tbHoaDonBanHangChiTiet();
                insertHD.hoadon_id = getDonHang.FirstOrDefault().hoadon_id;
                insertHD.product_id = Convert.ToInt32(arrId[i]);
                db.tbHoaDonBanHangChiTiets.InsertOnSubmit(insertHD);
                db.SubmitChanges();
            }
        }
        else
        {
            tbHoaDonBanHang insert = new tbHoaDonBanHang();
            insert.khachhang_id = idkhach;
            insert.hoadon_tinhtrang = "chua";
            db.tbHoaDonBanHangs.InsertOnSubmit(insert);
            db.SubmitChanges();

            var temp = (from hd in db.tbHoaDonBanHangs
                        orderby hd.hoadon_id descending
                        select hd).FirstOrDefault().hoadon_id;
            for (int i = 0; i < arrId.Length; i++)
            {
                tbHoaDonBanHangChiTiet insertHD = new tbHoaDonBanHangChiTiet();
                insertHD.hoadon_id = temp;
                insertHD.product_id = Convert.ToInt32(arrId[i]);
                db.tbHoaDonBanHangChiTiets.InsertOnSubmit(insertHD);
                db.SubmitChanges();
            }
        }
        Response.Redirect("/gio-hang");
    }
}