<%@ Page Language="C#" AutoEventWireup="true" CodeFile="module_Login.aspx.cs" Inherits="web_module_module_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Nhập</title>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <%--l--%>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Đăng Nhập</h3>
                    </div>
                    <div class="card-body">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" runat="server" id="txtuser" class="form-control" placeholder="Tên đăng nhập" />
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" runat="server" id="txtpass" class="form-control" placeholder="Mật khẩu" />
                        </div>
                        <div class="form-group">
                            <a href="#" runat="server" id="btnLgon" onserverclick="btnLgon_ServerClick" class="btn float-right login_btn">Login</a>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Bạn chưa có tài khoản?<a href="/dang-ky">Đăng ký</a>
                        </div>
                        <%--<div class="d-flex justify-content-center">
                            <a href="../forgot/forgot.html">Forgot your password?</a>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <style>
    	html, body {
    		background-image: url("/web_module/image/login.jpg");
    		background-size: cover;
    		background-repeat: no-repeat;
    		height: 100%;
    		font-family: 'Numans', sans-serif;
    	}

    	.container {
    		height: 100%;
    		align-content: center;
    	}

    	.card {
    		height: 370px;
    		margin-top: auto;
    		margin-bottom: auto;
    		width: 400px;
    		background-color: rgba(0,0,0,0.5) !important;
    	}

    	.social_icon span {
    		font-size: 60px;
    		margin-left: 10px;
    		color: #FFC312;
    	}

    		.social_icon span:hover {
    			color: white;
    			cursor: pointer;
    		}

    	.card-header h3 {
    		color: white;
    	}

    	.social_icon {
    		position: absolute;
    		right: 20px;
    		top: -45px;
    	}

    	.input-group-prepend span {
    		width: 50px;
    		background-color: #FFC312;
    		color: black;
    		border: 0 !important;
    	}

    	input:focus {
    		outline: 0 0 0 0 !important;
    		box-shadow: 0 0 0 0 !important;
    	}

    	.remember {
    		color: white;
    	}

    		.remember input {
    			width: 20px;
    			height: 20px;
    			margin-left: 15px;
    			margin-right: 5px;
    		}

    	.login_btn {
    		color: black;
    		background-color: #FFC312;
    		width: 100px;
    	}

    		.login_btn:hover {
    			color: black;
    			background-color: white;
    		}

    	.links {
    		color: white;
    	}

    		.links a {
    			margin-left: 4px;
    		}

    	.note {
    		text-align: center;
    		height: 80px;
    		background: -webkit-linear-gradient(left, #0072ff, #8811c5);
    		color: #fff;
    		font-weight: bold;
    		line-height: 80px;
    	}

    	.form-content {
    		padding: 5%;
    		border: 1px solid #ced4da;
    		margin-bottom: 2%;
    	}

    	.form-control {
    		border-radius: 1.5rem;
    	}

    	.btnSubmit {
    		border: none;
    		border-radius: 1.5rem;
    		padding: 1%;
    		width: 20%;
    		cursor: pointer;
    		background: #0062cc;
    		color: #fff;
    	}
    </style>
</body>
</html>
