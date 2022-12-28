using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UserNameWeb"] == null)
            {
                Response.Redirect("/dang-nhap");
            }
        }
    }

    protected void btnLogOut_ServerClick(object sender, EventArgs e)
    {
        if (HttpContext.Current != null)
        {
            int cookieCount = HttpContext.Current.Request.Cookies.Count;
            for (var i = 0; i < cookieCount; i++)
            {
                var cookie = HttpContext.Current.Request.Cookies[i];
                if (cookie != null)
                {
                    var expiredCookie = new HttpCookie(cookie.Name)
                    {
                        Expires = DateTime.Now.AddDays(-1),
                        Domain = cookie.Domain
                    };
                    HttpContext.Current.Response.Cookies.Add(expiredCookie); // overwrite it
                }
            }

            // clear cookies server side
            HttpContext.Current.Request.Cookies.Clear();
            Response.Redirect("/dang-nhap");
        }
    }
}
