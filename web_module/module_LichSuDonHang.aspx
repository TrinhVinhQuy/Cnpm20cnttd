<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_LichSuDonHang.aspx.cs" Inherits="web_module_module_LichSuDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <br />
        <br />
        <h1 class="text-center">Lịch sử mua hàng</h1>
        <table class="table table-bordered" style="width: 50%">
            <tr>
                <th>#</th>
                <th>Mã hoá đon</th>
                <th>Ngày mua</th>
                <th>Tổng tiền</th>
                <th>Tình Trạng</th>
                <th>#</th>
            </tr>
            <asp:Repeater runat="server" ID="rpLichSuDonHang">
                <ItemTemplate>
                    <tr>
                        <td><%=stt++ %></td>
                        <td><%#Eval("hoadon_id") %></td>
                        <td><%#Eval("hoadon_giothanhtoan") %></td>
                        <td><%#Eval("hoadon_tongtien") %></td>
                        <td><%#Eval("hoadon_tinhtrang") %></td>
                        <td><a href="#" onclick="getIDDH(<%#Eval("hoadon_id") %>)">Chi tiết</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <br />
        <br />
    </center>
    <div class="container" id="div_CTDH" runat="server">
        <h1 class="text-center">Chi tiết đơn hàng</h1>
        <br />
        <center>
            <table class="table table-bordered" style="width: 100%">
                <tr>
                    <th>#</th>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>#</th>
                </tr>
                <asp:Repeater runat="server" ID="rpCTDH">
                    <ItemTemplate>
                        <tr>
                            <td><%=stt1++ %></td>
                            <td><%#Eval("product_id") %></td>
                            <td><%#Eval("product_title") %></td>
                            <td>
                                <img style="width: 40%;" src="../images_SanPham/<%#Eval("product_image") %>" alt="Alternate Text" />
                            </td>
                            <td><%#Eval("hdct_price") %></td>
                            <td><%#Eval("hdct_soluong") %></td>
                            <td><a href="/san-pham-<%#Eval("product_id") %>">Xem thêm</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </center>
    </div>
    <div style="display: none">
        <input type="text" id="txtIDDH" runat="server" name="name" value="" />
        <a href="#" runat="server" id="btnChiTiet" onserverclick="btnChiTiet_ServerClick">content</a>
    </div>
    <script>
        function getIDDH(id) {
            document.getElementById("<%=txtIDDH.ClientID%>").value = id;
            document.getElementById("<%=btnChiTiet.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

