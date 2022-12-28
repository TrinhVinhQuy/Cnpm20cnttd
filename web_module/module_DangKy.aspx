<%@ Page Language="C#" AutoEventWireup="true" CodeFile="module_DangKy.aspx.cs" Inherits="web_module_module_DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Ký</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/bootstrap.min.js"></script>
    <style>
        /*l*/
        body {
            background-color: #8FC4B7;
        }

        .box {
            width: 100%;
            max-width: 600px;
            margin: auto;
            padding: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="box">
        <div class="form-group">
            <label for="exampleInputEmail1">Email</label>
            <input type="email" class="form-control" runat="server" id="txtEmail" aria-describedby="emailHelp" placeholder="Nhập email" />
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Tên Đăng nhập</label>
            <input type="text" class="form-control" runat="server" id="txtUser" aria-describedby="emailHelp" placeholder="Nhập username" />
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Số điện thoại</label>
            <input type="text" class="form-control" runat="server" id="txtSDT" placeholder="Nhập số điện thoại" />
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" runat="server" id="txtPass" placeholder="Nhập mật khẩu" />
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Confirm password</label>
            <input type="password" class="form-control" id="txtPassNL" placeholder="Nhập lại mật khẩu" />
        </div>
        <a class="btn btn-success" onclick="check()">Đăng kí</a>
        <a class="btn btn-light" href="/dang-nhap">Đăng nhập</a>
        <div style="display: none">
            <a href="#" runat="server" id="btnLuu" onserverclick="btnLuu_ServerClick"></a>
        </div>
    </form>
    <script>
        function check() {
            let t = 0;
            if (document.getElementById("<%=txtPass.ClientID%>").value != document.getElementById("txtPassNL").value) {
                alert("Mật khẩu nhập lại không trùng!");
                t = t + 1;
            }
            if (document.getElementById("<%=txtEmail.ClientID%>").value == "" || document.getElementById("<%=txtUser.ClientID%>").value == "" || document.getElementById("<%=txtSDT.ClientID%>").value == "" || document.getElementById("<%=txtPass.ClientID%>").value == "") {
                alert("Vui lòng nhập đủ thông tin!");
                t = t + 1;
            }
            if (t == 0) {
                document.getElementById("<%=btnLuu.ClientID%>").click();
            }
        }
    </script>
</body>
</html>
