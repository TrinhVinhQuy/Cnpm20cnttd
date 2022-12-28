using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_LichSuDonHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var idkhach = (from kh in db.tbCustomerAccounts
                       where kh.customer_user == Request.Cookies["UserNameWeb"].Value
                       select kh).FirstOrDefault().customer_id;
        var mua = from hd in db.tbHoaDonBanHangs
                  where hd.khachhang_id == idkhach
                  && hd.hoadon_tinhtrang != "chua"
                  select new
                  {
                      hd.hoadon_id,
                      hd.hoadon_createdate,
                      hd.hoadon_tongtien,
                      hd.hoadon_tinhtrang
                  };
        rpMua.DataSource = mua;
        rpMua.DataBind();
        //var huy = from hd in db.tbHoaDonBanHangs
        //          where hd.hoadon_tinhtrang == "huy"
        //          && hd.khachhang_id == idkhach
        //          select new
        //          {
        //              hd.hoadon_createdate,
        //              hd.hoadon_tongtien,
        //          };
        //rpHuy.DataSource = huy;
        //rpHuy.DataBind();
    }
}