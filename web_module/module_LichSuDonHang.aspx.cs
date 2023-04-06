using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_LichSuDonHang : System.Web.UI.Page
{
    public int stt = 1;
    public int stt1 = 1;
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getLSDH = from hd in db.tbHoaDonBanHangs
                      where hd.khachhang_id == (from acc in db.tbCustomerAccounts
                                                where acc.customer_user == Request.Cookies["User"].Value
                                                select acc).FirstOrDefault().customer_id
                      orderby hd.hoadon_id descending
                      select new
                      {
                          hd.hoadon_id,
                          hd.hoadon_giothanhtoan,
                          hd.hoadon_tongtien,
                      };
        rpLichSuDonHang.DataSource = getLSDH;
        rpLichSuDonHang.DataBind();
        div_CTDH.Visible = false;
    }

    protected void btnChiTiet_ServerClick(object sender, EventArgs e)
    {
        var getCTDH = from hd in db.tbHoaDonBanHangs
                      join hdct in db.tbHoaDonBanHangChiTiets on hd.hoadon_id equals hdct.hoadon_id
                      join pr in db.tbProducts on hdct.product_id equals pr.product_id
                      where hdct.hoadon_id == Convert.ToInt32(txtIDDH.Value)
                      select new
                      {
                          hdct.hdct_id,
                          pr.product_id,
                          pr.product_title,
                          hdct.hdct_soluong,
                          hdct.hdct_price,
                          pr.product_image,
                      };
        rpCTDH.DataSource = getCTDH;
        rpCTDH.DataBind();
        div_CTDH.Visible = true;
    }
}