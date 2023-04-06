using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ThongTinKhachHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void loadData()
    {
        var getTT = from acc in db.tbCustomerAccounts
                    where acc.customer_user == Request.Cookies["User"].Value
                    select acc;
        txtTen.Value = getTT.FirstOrDefault().customer_fullname;
        txtSdt.Value = getTT.FirstOrDefault().customer_phone;
        txtDiaChi.Value = getTT.FirstOrDefault().customer_address;
        txtEmail.Value = getTT.FirstOrDefault().customer_email;
    }
    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        var idkhach = (from acc in db.tbCustomerAccounts
                       where acc.customer_user == Request.Cookies["User"].Value
                       select acc).FirstOrDefault().customer_id;
        tbCustomerAccount update = db.tbCustomerAccounts.Where(x => x.customer_id == idkhach).FirstOrDefault();
        update.customer_fullname = ten.Value;
        update.customer_address = diachi.Value;
        update.customer_phone = sdt.Value;
        update.customer_email = email.Value;
        db.SubmitChanges();
        alert.alert_Success(Page, "Cập nhật thông tin thành công", "");
        loadData();
    }
}