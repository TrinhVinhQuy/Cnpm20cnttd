using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_GioHang : System.Web.UI.Page
{
    private int idkhach;
    private int Tien;
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        LoadData();
    }
    protected void LoadData()
    {
        idkhach = (from kh in db.tbCustomerAccounts
                   where kh.customer_user == Request.Cookies["UserNameWeb"].Value
                   select kh).FirstOrDefault().customer_id;
        var getHang = from hd in db.tbHoaDonBanHangs
                      join hdct in db.tbHoaDonBanHangChiTiets on hd.hoadon_id equals hdct.hoadon_id
                      join pr in db.tbProducts on hdct.product_id equals pr.product_id
                      where hd.khachhang_id == idkhach
                      && hd.hoadon_tinhtrang == "chua"
                      select pr;
        if (getHang.Count() > 0)
        {
            var TongTien = string.Join(";", getHang.Select(i => i.product_price));
            int[] arr = TongTien.Split(';').Select(h => Int32.Parse(h)).ToArray();
            int Tien = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                Tien = Tien + arr[i];
            }
            txtTien.Value = Convert.ToString(Tien);
        }
        else
        {
            btnMua.Visible = false;
            btnHuyMua.Visible = false;
        }
        var getGioHang = from hd in db.tbHoaDonBanHangs
                         join hdct in db.tbHoaDonBanHangChiTiets on hd.hoadon_id equals hdct.hoadon_id
                         join pr in db.tbProducts on hdct.product_id equals pr.product_id
                         where hd.khachhang_id == idkhach
                         && hd.hoadon_tinhtrang == "chua"
                         select new
                         {
                             hd.hoadon_id,
                             hdct.hdct_id,
                             pr.product_image,
                             pr.product_price,
                             pr.product_price_new,
                             pr.product_promotions,
                             pr.product_title,
                         };
        rpGioHang.DataSource = getGioHang;
        rpGioHang.DataBind();
    }

    protected void btnMua_ServerClick(object sender, EventArgs e)
    {

        var update = db.tbHoaDonBanHangs.Where(i => i.hoadon_id == Convert.ToInt32(txtHD.Value)).FirstOrDefault();
        update.hoadon_tinhtrang = "mua";
        update.hoadon_createdate = DateTime.Now;
        update.hoadon_tongtien = txtTien.Value;
        db.SubmitChanges();
        Response.Redirect("/trang-chu");
    }

    protected void btnHuyMua_ServerClick(object sender, EventArgs e)
    {
        var update = db.tbHoaDonBanHangs.Where(i => i.hoadon_id == Convert.ToInt32(txtHD.Value)).FirstOrDefault();
        update.hoadon_tinhtrang = "huy";
        update.hoadon_createdate = DateTime.Now;
        update.hoadon_tongtien = txtTien.Value;
        db.SubmitChanges();
        Response.Redirect("/trang-chu");
    }

    protected void btnXoa_ServerClick(object sender, EventArgs e)
    {
        var delete = db.tbHoaDonBanHangChiTiets.Where(i => i.hdct_id == Convert.ToInt32(txtXoa.Value)).FirstOrDefault();
        db.tbHoaDonBanHangChiTiets.DeleteOnSubmit(delete);
        db.SubmitChanges();
        LoadData();
    }
}