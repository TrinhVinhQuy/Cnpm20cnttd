using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_UserManage : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userName"].Value != null)
        {
            //admin_User logedMember = Session["AdminLogined"] as admin_User;
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }

        }
        else
        {
            Response.Redirect("/admin-login");
        }
        loadData();
    }
    // Dành cho root
    private void loadData()
    {
        var getData = from hd in db.tbHoaDonBanHangs
                      join tk in db.tbCustomerAccounts on hd.khachhang_id equals tk.customer_id
                      where hd.hoadon_tinhtrang == "Chờ duyệt" || hd.hoadon_tinhtrang == "Đang giao"
                      orderby hd.hoadon_giothanhtoan descending
                      select new
                      {
                          hd.hoadon_id,
                          hd.khachhang_name,
                          tk.customer_phone,
                          tk.customer_address,
                          hd.hoadon_tongtien,
                          hd.hoadon_tinhtrang,
                          hd.hoadon_giothanhtoan,
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
        
    }
    private void setNULL()
    {

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "hoadon_id" }));
        Session["_id"] = _id;
        var getData = from hd in db.tbHoaDonBanHangs
                      join hdct in db.tbHoaDonBanHangChiTiets on hd.hoadon_id equals hdct.hoadon_id
                      join pr in db.tbProducts on hdct.product_id equals pr.product_id
                      where hd.hoadon_id == _id
                      orderby hd.hoadon_giothanhtoan descending
                      select new
                      {
                          hdct.hoadon_id,
                          pr.product_title,
                          hdct.hdct_soluong,
                          hdct.hdct_price,
                      };
        grvHDCT.DataSource = getData;
        grvHDCT.DataBind();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {

        cls_GiaoVien cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "username_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_GiaoVien();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }


    //Kiểm tra Email
    private bool isEmail(string txtEmail)
    {
        Regex re = new Regex(@"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
        @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                      RegexOptions.IgnoreCase);
        return re.IsMatch(txtEmail);
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "hoadon_id" }));
        Session["_id"] = _id;
        tbHoaDonBanHang update = db.tbHoaDonBanHangs.Where(id => id.hoadon_id == _id).FirstOrDefault();
        update.hoadon_tinhtrang = "Đang giao";
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }

    
   



    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "hoadon_id" }));
        Session["_id"] = _id;
        tbHoaDonBanHang update = db.tbHoaDonBanHangs.Where(id => id.hoadon_id == _id).FirstOrDefault();
        update.hoadon_tinhtrang = "Giao hàng thành công";
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
}