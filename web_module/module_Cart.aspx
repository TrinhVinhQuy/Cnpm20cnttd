<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_Cart.aspx.cs" Inherits="web_module_module_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .input-dangnhap {
            width: 30%;
            text-align: center;
            background: #cd6420;
            padding: 7px;
            font-size: 20px;
            color: white;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MASANPHAM" HeaderText="Mã sản phẩm" />
                <asp:BoundField DataField="TENSANPHAM" HeaderText="Tên sản phẩm" />
                <asp:ImageField DataAlternateTextField="HINHANH" ControlStyle-Width="150" DataImageUrlField="HINHANH" DataImageUrlFormatString="" ControlStyle-CssClass="img-thumbnail" HeaderText="Ảnh sản phẩm">
                </asp:ImageField>
                <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                <asp:BoundField DataField="DONGIA" HeaderText="Đơn gia" />
                <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
                <asp:TemplateField HeaderText="Chọn">
                    <ItemTemplate>
                        <asp:CheckBox ID="ckbITEM" runat="server" />
                    </ItemTemplate>
                    <%--<FooterTemplate>
                </FooterTemplate>--%>
                </asp:TemplateField>
            </Columns>

            <%--<EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />--%>
        </asp:GridView>
        <br />
        <asp:Button ID="btn_Xoa" runat="server" CssClass="input-dangnhap" Width="7%" OnClick="btn_Xoa_Click" Text="Trả hàng" />
        <br />
        <br />
        <a href="#" runat="server" id="btnMuaHang" class="input-dangnhap" onserverclick="btnMuaHang_ServerClick">Mua hàng</a>
        <br />
        <br />
        <br />
    </center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>

