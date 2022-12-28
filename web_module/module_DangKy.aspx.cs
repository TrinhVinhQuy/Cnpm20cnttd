using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_DangKy : System.Web.UI.Page
{
    cls_Alert alert = new cls_Alert();
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        tbCustomerAccount insert = new tbCustomerAccount();
        insert.customer_user = txtUser.Value;
        insert.customer_email = txtEmail.Value;
        insert.customer_phone = txtSDT.Value;
        insert.customer_pass = txtPass.Value;
        db.tbCustomerAccounts.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
            Response.Redirect("/dang-nhap");
        }
        catch { }
    }
}