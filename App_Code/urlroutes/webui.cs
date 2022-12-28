using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for webui
/// </summary>
public class webui
{
	public webui()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        list.Add("webTrangChu|trang-chu|~/web_module/module_TrangChu.aspx");
        // Introduce

        //Đăng ký
        list.Add("webDangKy|dang-ky|~/web_module/module_DangKy.aspx");
        //Đăng Nhập
        list.Add("webDangNhap|dang-nhap|~/web_module/module_Login.aspx");
        //Shop Now
        list.Add("webShopNow|Shop-Now|~/web_module/module_ShopNow.aspx");
        //Giỏ hàng
        list.Add("webgiohang|gio-hang|~/web_module/module_GioHang.aspx");
        //Lịch sữ đơn hàng
        list.Add("weblichsudonhang|lich-su-don-hang|~/web_module/module_LichSuDonHang.aspx");
        //Chi tiết đơn hàng
        list.Add("webchitietdonhang|chi-tiet-don-hang-{id}|~/web_module/module_ChiTietDonHang.aspx");
        return list;
    }
}