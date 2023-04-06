<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_ChiTietSanPham.aspx.cs" Inherits="web_module_module_ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .input-dangnhap {
            width: 17%;
            text-align: center;
            background: #cd6420;
            padding: 7px;
            font-size: 15px;
            color: white;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-4 p-3">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" style="border: 1px solid #ff6a00" src="../images_SanPham/<%=img1 %>" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" style="border: 1px solid #ff6a00" src="../images_SanPham/<%=img2 %>" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" style="border: 1px solid #ff6a00" src="../images_SanPham/<%=img3 %>" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-8 p-3">
                <asp:Repeater runat="server" ID="rpSanPham">
                    <ItemTemplate>
                        <div style="display: grid">
                            <h3><%#Eval("product_title") %></h3>
                            <span style="font-size: 13px;">Thương hiệu <a href="#"><%#Eval("city_name") %></a> </span>
                            <br />
                            <p>
                                <span>Giá: </span>
                                <span style="color: orangered; font-size: 17px; font-weight: 500;"><%#Eval("product_price_new") %> đ </span>
                                <span style="font-size: 15px; color: #888; text-decoration: line-through; font-weight: 500;"><%#Eval("product_price") %> đ</span>
                            </p>
                            <span>Số lượng còn lại: <b><%#Eval("product_soluong") %></b> sản phẩm</span>
                            <span>--------------------------------------</span>
                            <div style="display: flex; align-items: center;">
                                <input type="range" min="1" max="<%#Eval("product_soluong") %>" value="1" class="slider" id="myRange">
                                <span class="ml-3 mr-3">Số lượng: <b id="sliderValue"></b></span>
                                <a href="#" class="input-dangnhap" onclick="getGioHang()">Thêm giỏ hàng</a>
                            </div>
                            <span>--------------------------------------</span>
                            <span style="font-size: 40px; color: brown; font-weight: 600;">Mô tả sản phẩm</span><br />
                            <div><%#Eval("product_content") %></div>
                            <div style="display: none">
                                <input type="text" id="txtIdSp" name="name" value="<%#Eval("product_id") %>" />
                                <input type="text" id="txtDonGia" name="name" value="<%#Eval("product_price_new") %>" />
                                <input type="text" id="txtTenSp" name="name" value="<%#Eval("product_title") %>" />
                                <input type="text" id="txtImg" name="name" value="../images_SanPham/<%=img1 %>" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div style="display: none">
            <input type="text" runat="server" id="txtSoLuong" name="name" value="" />
            <input type="text" runat="server" id="txtDonGia" name="name" value="" />
            <input type="text" runat="server" id="txtTenSp" name="name" value="" />
            <input type="text" runat="server" id="txtImg" name="name" value="" />
            <input type="text" runat="server" id="txtIdSp" name="name" value="" />
            <a href="#" runat="server" id="btnGioHang" onserverclick="btnGioHang_ServerClick">content</a>
        </div>
    </div>
    <script>
        var slider = document.getElementById("myRange");
        var output = document.getElementById("sliderValue");
        output.innerHTML = slider.value;

        slider.oninput = function () {
            output.innerHTML = this.value;
        }
        function getGioHang() {
            //console.log(document.getElementById("myRange").value)
            document.getElementById("<%=txtSoLuong.ClientID%>").value = document.getElementById("myRange").value
            document.getElementById("<%=txtDonGia.ClientID%>").value = document.getElementById("txtDonGia").value
            document.getElementById("<%=txtTenSp.ClientID%>").value = document.getElementById("txtTenSp").value
            document.getElementById("<%=txtImg.ClientID%>").value = document.getElementById("txtImg").value
            document.getElementById("<%=txtIdSp.ClientID%>").value = document.getElementById("txtIdSp").value
            document.getElementById("<%=btnGioHang.ClientID%>").click();
            //console.log(document.getElementById("myRange").value)
            //console.log(document.getElementById("txtDonGia").value)
            //console.log(document.getElementById("txtTenSp").value)
            //console.log(document.getElementById("txtImg").value)
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

