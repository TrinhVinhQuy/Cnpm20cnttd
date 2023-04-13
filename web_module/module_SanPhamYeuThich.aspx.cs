using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_SanPhamYeuThich : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        LoadData();
    }
    protected void LoadData()
    {
        var id = (from acc in db.tbCustomerAccounts
                  where acc.customer_user == Request.Cookies["User"].Value
                  select acc).FirstOrDefault().customer_id;
        var getSpyt = from pr in db.tbProducts
                      join ct in db.tbCities on Convert.ToInt32(pr.h1_seo) equals ct.city_id
                      join yt in db.tbSanPhamYeuThiches on pr.product_id equals yt.product_id
                      where yt.khachhang_id == id && yt.spyt_hidden == null
                      select new
                      {
                          pr.product_id,
                          pr.product_image,
                          ct.city_name,
                          pr.product_title,
                          pr.product_price_new,
                          pr.product_price,
                          color = (from ytt in db.tbSanPhamYeuThiches
                                   where ytt.product_id == pr.product_id && ytt.spyt_hidden == null
                                   select ytt).FirstOrDefault().spyt_color,
                      };
        rpSpyt.DataSource = getSpyt;
        rpSpyt.DataBind();
    }
    protected void btnLike_ServerClick(object sender, EventArgs e)
    {
        var id = (from acc in db.tbCustomerAccounts
                  where acc.customer_user == Request.Cookies["User"].Value
                  select acc).FirstOrDefault().customer_id;
        var check = from yt in db.tbSanPhamYeuThiches
                    where yt.product_id == Convert.ToInt32(txtLike.Value)
                    && yt.spyt_hidden == null
                    && yt.khachhang_id == id
                    select yt;
        if (check.Count() > 0)
        {
            tbSanPhamYeuThich delete = db.tbSanPhamYeuThiches.Where(x => x.spyt_id == check.FirstOrDefault().spyt_id).FirstOrDefault();
            delete.spyt_hidden = false;
            try
            {
                db.SubmitChanges();
            }
            catch
            {
            }
        }
        else
        {
            tbSanPhamYeuThich ins = new tbSanPhamYeuThich();
            ins.product_id = Convert.ToInt32(txtLike.Value);
            ins.khachhang_id = id;
            ins.spyt_color = "color: red;";
            db.tbSanPhamYeuThiches.InsertOnSubmit(ins);
            try
            {
                db.SubmitChanges();
            }
            catch
            {
            }
        }
        LoadData();
    }
}