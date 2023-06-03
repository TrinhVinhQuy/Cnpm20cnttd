<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_ThongTinKhachHang.aspx.cs" Inherits="web_module_module_ThongTinKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .input-dangnhap {
            width: 30%;
            text-align: center;
            background: #cd6420;
            padding: 7px;
            font-size: 16px;
            color: white;
            border-radius: 5px;
        }

        label {
            font-weight: 500;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 30%; margin-left: 35%">
        <br />
        <br />
        <h1 class="text-center">Thông tin cá nhân</h1>
        <br />
        <div style="display: grid;">
            <label>Tên khách hàng</label>
            <input type="text" runat="server" id="txtTen" name="name" value="" />
            <label>Địa chỉ</label>
            <input type="text" runat="server" id="txtDiaChi" name="name" value="" />
            <label>Số điện thoại</label>
            <input type="text" runat="server" id="txtSdt" name="name" value="" />
            <label>Email</label>
            <input type="text" runat="server" id="txtEmail" name="name" value="" />
            <label>Mật khẩu</label>
            <input type="text" runat="server" id="txtPass" name="name" value="" />
            <br />
            <div style="display: grid; justify-items: center;">
                <a href="#" class="input-dangnhap" onclick="getTT()">Lưu</a>
            </div>
        </div>
        <br />
        <br />
        <div style="display: none">
            <a href="#" runat="server" id="btnLuu" style="display: none" onserverclick="btnLuu_ServerClick">Lưu</a>
            <input type="text" runat="server" id="ten" name="name" value="" />
            <input type="text" runat="server" id="diachi" name="name" value="" />
            <input type="text" runat="server" id="sdt" name="name" value="" />
            <input type="text" runat="server" id="email" name="name" value="" />
            <input type="text" runat="server" id="pass" name="name" value="" />
        </div>
        <script>
            function getTT() {
                document.getElementById("<%=ten.ClientID%>").value = document.getElementById("<%=txtTen.ClientID%>").value;
                document.getElementById("<%=diachi.ClientID%>").value = document.getElementById("<%=txtDiaChi.ClientID%>").value;
                document.getElementById("<%=sdt.ClientID%>").value = document.getElementById("<%=txtSdt.ClientID%>").value;
                document.getElementById("<%=email.ClientID%>").value = document.getElementById("<%=txtEmail.ClientID%>").value;
                document.getElementById("<%=pass.ClientID%>").value = document.getElementById("<%=txtPass.ClientID%>").value;
                document.getElementById("<%=btnLuu.ClientID%>").click();
            }
        </script>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

