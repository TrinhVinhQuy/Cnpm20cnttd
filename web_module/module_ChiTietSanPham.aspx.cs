using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ChiTietSanPham : System.Web.UI.Page
{
    public string img1;
    public string img2;
    public string img3;
    dbcsdlDataContext db = new dbcsdlDataContext();
    private int _idKhach;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["User"].Value != null)
        {
            //admin_User getusername = Session["AdminLogined"] as admin_User;
            _idKhach = (from acc in db.tbCustomerAccounts
                        where acc.customer_user == Request.Cookies["User"].Value
                        select acc).FirstOrDefault().customer_id;
        }
        else
        {
            Response.Redirect("/login");
        }
        var getChiTiet = from pr in db.tbProducts
                         join prc in db.tbProductCates on pr.productcate_id equals prc.productcate_id
                         join ct in db.tbCities on Convert.ToInt32(pr.h1_seo) equals ct.city_id
                         where pr.product_id ==  Convert.ToInt32(RouteData.Values["id_ctsp"])
                         select new
                         {
                             pr.product_id,
                             pr.product_image,
                             pr.product_title,
                             ct.city_name,
                             pr.product_price_new,
                             pr.product_price,
                             pr.product_content,
                             pr.title_web,
                             pr.meta_title,
                             pr.product_soluong,
                         };
        rpSanPham.DataSource = getChiTiet;
        rpSanPham.DataBind();
        img1 = getChiTiet.FirstOrDefault().product_image;
        img2 = getChiTiet.FirstOrDefault().title_web;
        img3 = getChiTiet.FirstOrDefault().meta_title;
    }

    protected void btnGioHang_ServerClick(object sender, EventArgs e)
    {
        String masanpham = txtIdSp.Value;
        String tensanpham = txtTenSp.Value;
        double dongia = Convert.ToDouble(txtDonGia.Value);
        int soluong = Convert.ToInt32(txtSoLuong.Value);
        String hinhanh = txtImg.Value;

        Cart cart = new Cart();
        Session.Timeout = 10;
        if(Session["Cart"] != null)
        {
            cart = (Cart)Session["Cart"];
        }
        else
        {
            cart = new Cart();
        }
        cart.AddCart(masanpham, tensanpham, hinhanh, soluong, dongia, _idKhach);
        Session["Cart"] = cart;
        //Response.Redirect("/gio-hang");
        //App_Code.CART cart;
        //Session.Timeout = 3;
        //if (Session["CART"] != null)
        //    cart = (App_Code.CART)Session["CART"];
        //else
        //    cart = new App_Code.CART();
        //cart.AddCart(masanpham, tensanpham, hinhanh, soluong, dongia);
        //Session["CART"] = cart;
        //Response.Redirect("gio-hang");
        alert.alert_Success(Page, "Đã thêm vào giỏ hàng", "");
    }
}