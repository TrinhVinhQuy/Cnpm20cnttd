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
        list.Add("webTrangChu|home|~/web_module/module_TrangChu.aspx");
        // Introduce

        //Đăng ký
        list.Add("webDangKy|login|~/web_module/module_Login.aspx");
        //Đăng Nhập
        list.Add("webDangNhap|dang-ky|~/web_module/module_DangKy.aspx");
        //Chi tiết
        list.Add("webchitiet|chi-tiet-{id_ct}|~/web_module/module_ChiTiet.aspx");
        //Sản phẩm
        list.Add("websanpham|san-pham-{id_ctsp}|~/web_module/module_ChiTietSanPham.aspx");
        list.Add("webgiohang|gio-hang|~/web_module/module_Cart.aspx");
        list.Add("weblichsudonhang|lich-su-don-hang|~/web_module/module_LichSuDonHang.aspx");
        list.Add("webthongtinkhachhang|thong-tin-khach-hang|~/web_module/module_ThongTinKhachHang.aspx");
        return list;
    }
}