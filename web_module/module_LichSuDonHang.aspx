<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_LichSuDonHang.aspx.cs" Inherits="web_module_module_LichSuDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <style>
        table {
            font-size: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <center>
            <h3 style="font-size: 80px">Lịch sử mua</h3>
        </center>
        <table class="table">
            <tr>
                <th>Ngày</th>
                <th>Thành Tiền</th>
                <th>Tình trạng</th>
                <th>Chi Tiết</th>
            </tr>
            <asp:Repeater runat="server" ID="rpMua">
                <ItemTemplate>
                    <tr>
                        <td><%#Convert.ToDateTime(Eval("hoadon_createdate")).ToShortDateString() %></td>
                        <td><%#Eval("hoadon_tongtien") %></td>
                        <td><%#Eval("hoadon_tinhtrang") %></td>
                        <td><a href="chi-tiet-don-hang-<%#Eval("hoadon_id") %>">Chi Tiết</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <%--<div class="container">
        <h3>Lịch sử huỷ</h3>
        <table class="table">
            <tr>
                <th>Ngày mua</th>
                <th>Thành Tiền</th>
                <th>Chi Tiết</th>
            </tr>
            <asp:Repeater runat="server" ID="rpHuy">
                <ItemTemplate>
                    <tr>
                        <td><%#Convert.ToDateTime(Eval("hoadon_createdate")).ToShortDateString() %></td>
                        <td><%#Eval("hoadon_tongtien") %></td>
                        <td><a href="#">Chi Tiết</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>--%>
    <br />
</asp:Content>

