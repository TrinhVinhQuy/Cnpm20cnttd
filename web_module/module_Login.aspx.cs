using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UserNameWeb"] != null)
            {
                txtuser.Value = Request.Cookies["UserNameWeb"].Value;
            }
        }
    }

    protected void btnLgon_ServerClick(object sender, EventArgs e)
    {
        var check = from kh in db.tbCustomerAccounts
                    where kh.customer_user == txtuser.Value
                    && kh.customer_pass == txtpass.Value
                    select kh;
        string userName = txtuser.Value.Trim();
        if (check.Count() > 0)
        {
            tbCustomerAccount list = check.Single();
            HttpCookie ck = new HttpCookie("UserNameWeb");
            string s = ck.Value;
            ck.Value = userName;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            Response.Redirect("/trang-chu");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}