using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_NhapHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public int stt = 1;
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var listDanhMuc = from prc in db.tbProductCates
                              select prc;
            dllDangMuc.Items.Clear();
            dllDangMuc.AppendDataBoundItems = true;
            dllDangMuc.Items.Insert(0, "Chọn danh mục");
            dllDangMuc.DataTextField = "productcate_title"; //đầm
            dllDangMuc.DataValueField = "productcate_id"; //6
            dllDangMuc.DataSource = listDanhMuc;
            dllDangMuc.DataBind();
        }
    }
    private void loaddata()
    {
        var getSanPham = from prc in db.tbProductCates
                         join pr in db.tbProducts on prc.productcate_id equals pr.productcate_id
                         where prc.productcate_id == Convert.ToInt32(dllDangMuc.SelectedValue)
                         select new
                         {
                             pr.product_id,
                             pr.product_title,
                             pr.product_image,
                             pr.product_soluong,
                             pr.product_price,
                             pr.product_price_new,
                         };
        rpNhapHang.DataSource = getSanPham;
        rpNhapHang.DataBind();
    }



    protected void btnluu_ServerClick(object sender, EventArgs e)
    {
        tbProduct update = db.tbProducts.Where(x => x.product_id == Convert.ToInt32(txtid.Value)).FirstOrDefault();
        if (txtsl.Value != "")
        {
            update.product_soluong = Convert.ToInt32(txtsl.Value);
        }
        if (txtgia.Value != "")
        {
            update.product_price = Convert.ToInt32(txtgia.Value);
        }
        if (txtgiamgia.Value != "")
        {
            update.product_price_new = Convert.ToInt32(txtgiamgia.Value);
        }
        db.SubmitChanges(); loaddata();
        alert.alert_Success(Page, "Cập nhật thành công", "");

    }

    protected void dllDangMuc_SelectedIndexChanged(object sender, EventArgs e)
    {
        loaddata();
    }
}