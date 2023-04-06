using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_Cart : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    private string _diachi;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        Cart cart = new Cart();
        if (Session["Cart"] == null)
        {
            Response.Redirect("home");
        }
        if (!IsPostBack)
        {
            if (Request.Cookies["User"].Value == null)

            {
                Response.Redirect("/login");
            }
            if (Session["Cart"] != null)
            {
                cart = (Cart)Session["Cart"];
                this.GridView1.DataSource = cart.LISTCARTS.Values.ToList();
                this.GridView1.DataBind();
                this.GridView1.FooterRow.Cells[2].Text = "Tổng tiền=";
                this.GridView1.FooterRow.Cells[5].Text = cart.TotalBill().ToString();
            }
        }


        //App_Code.CART cart;
        //if (Session["CART"] != null && !IsPostBack)
        //{
        //    cart = (App_Code.CART)Session["CART"];
        //    this.GridView1.DataSource = cart.LISTCARTS.Values.ToList();
        //    this.GridView1.DataBind();
        //    this.GridView1.FooterRow.Cells[2].Text = "Tổng tiền=";
        //    this.GridView1.FooterRow.Cells[5].Text = cart.TotalBill().ToString();
        //}
    }

    protected void btn_Xoa_Click(object sender, EventArgs e)
    {
        Cart cart = (Cart)Session["Cart"];
        foreach (GridViewRow ROW in this.GridView1.Rows)
        {
            CheckBox CKB = (CheckBox)ROW.FindControl("ckbITEM");
            if (CKB.Checked)
            {
                cart.RemoveCart(ROW.Cells[0].Text);
            }
        }
        this.GridView1.DataSource = cart.LISTCARTS.Values.ToList();
        this.GridView1.DataBind();
        this.GridView1.FooterRow.Cells[2].Text = "Tổng tiền=";
        this.GridView1.FooterRow.Cells[5].Text = cart.TotalBill().ToString();
        //App_Code.CART cart = (App_Code.CART)Session["CART"];
        foreach (GridViewRow ROW in this.GridView1.Rows)
        {
            CheckBox CKB = (CheckBox)ROW.FindControl("ckbITEM");
            if (CKB.Checked)
            {
                cart.RemoveCart(ROW.Cells[0].Text);
            }
        }
        this.GridView1.DataSource = cart.LISTCARTS.Values.ToList();
        this.GridView1.DataBind();
        this.GridView1.FooterRow.Cells[2].Text = "Tổng tiền=";
        this.GridView1.FooterRow.Cells[5].Text = cart.TotalBill().ToString();
    }

    protected void btnMuaHang_ServerClick(object sender, EventArgs e)
    {
        var check = false;
        foreach (GridViewRow ROW in this.GridView1.Rows)
        {
            CheckBox CKB = (CheckBox)ROW.FindControl("ckbITEM");
            if (CKB.Checked)
            {
                check = true;
            }
        }
        if (check)
        {
            var time = DateTime.Now;
            var tongtien = 0;
            Cart cart = (Cart)Session["Cart"];
            foreach (GridViewRow ROW in this.GridView1.Rows)
            {
                CheckBox CKB = (CheckBox)ROW.FindControl("ckbITEM");
                if (CKB.Checked)
                {
                    tongtien += int.Parse(ROW.Cells[3].Text) * int.Parse(ROW.Cells[5].Text);
                }
            }
            tbHoaDonBanHang insert = new tbHoaDonBanHang();
            insert.khachhang_id = (from acc in db.tbCustomerAccounts
                                   where acc.customer_user == Request.Cookies["User"].Value
                                   select acc).FirstOrDefault().customer_id;
            insert.khachhang_name = (from acc in db.tbCustomerAccounts
                                     where acc.customer_user == Request.Cookies["User"].Value
                                     select acc).FirstOrDefault().customer_fullname;
            insert.hoadon_giothanhtoan = time;
            insert.hoadon_tongtien = cart.TotalBill().ToString();
            db.tbHoaDonBanHangs.InsertOnSubmit(insert);
            db.SubmitChanges();

            var getIdHD = (from hd in db.tbHoaDonBanHangs
                           where hd.khachhang_id == (from acc in db.tbCustomerAccounts
                                                     where acc.customer_user == Request.Cookies["User"].Value
                                                     select acc).FirstOrDefault().customer_id
                           && hd.hoadon_giothanhtoan == time
                           select hd);

            foreach (GridViewRow ROW in this.GridView1.Rows)
            {
                CheckBox CKB = (CheckBox)ROW.FindControl("ckbITEM");
                if (CKB.Checked)
                {
                    tbHoaDonBanHangChiTiet insertCT = new tbHoaDonBanHangChiTiet();
                    insertCT.hoadon_id = getIdHD.FirstOrDefault().hoadon_id;
                    insertCT.product_id = int.Parse(ROW.Cells[0].Text);
                    insertCT.hdct_soluong = int.Parse(ROW.Cells[3].Text);
                    insertCT.hdct_price = string.Format(ROW.Cells[5].Text);
                    db.tbHoaDonBanHangChiTiets.InsertOnSubmit(insertCT);
                    db.SubmitChanges();
                    cart.RemoveCart(ROW.Cells[0].Text);
                }
            }

            this.GridView1.DataSource = cart.LISTCARTS.Values.ToList();
            this.GridView1.DataBind();
            this.GridView1.FooterRow.Cells[2].Text = "Tổng tiền=";
            this.GridView1.FooterRow.Cells[5].Text = cart.TotalBill().ToString();
            alert.alert_Success(Page, "Mua hàng thành công", "");
        }
        else {
            alert.alert_Warning(Page, "Vui lòng chọn sản phẩm", "");
        }
    }
}