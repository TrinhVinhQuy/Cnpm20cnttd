<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_ShopNow.aspx.cs" Inherits="web_module_module_ShopNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btnMua {
            position: fixed;
            top: 13%;
            left: 2%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <a href="#" onclick="LuuData()" class="btn btnMua">Vào giỏ hàng</a>
    <section class="products" id="products_nam">

        <h1 class="heading">Đồ Nam </h1>

        <div class="box-container">
            <asp:Repeater runat="server" ID="rpProduct_nam">
                <ItemTemplate>
                    <div class="box" data-item="featured">
                        <div class="icons">
                            <a href="javascript:void(0)" onclick="getId(<%#Eval("product_id") %>)" class="fas fa-shopping-cart"></a>

                        </div>
                        <div class="image">
                            <img src="<%#Eval("product_image") %>" alt="">
                        </div>
                        <div class="content">
                            <h3><%#Eval("product_title") %></h3>
                            <div class="price">
                                <div class="amount"><%#Eval("product_price") %></div>
                                <div class="cut"><%#Eval("product_price_new") %></div>
                                <div class="offer"><%#Eval("product_promotions") %>% off</div>
                            </div>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(50)</span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </section>
    <section class="products" id="products_nu">

        <h1 class="heading">Đồ Nữ</h1>

        <div class="box-container">
            <asp:Repeater runat="server" ID="rpProduct_nu">
                <ItemTemplate>
                    <div class="box" data-item="featured">
                        <div class="icons">
                            <a href="javascript:void(0)" onclick="getId(<%#Eval("product_id") %>)" class="fas fa-shopping-cart"></a>
                        </div>
                        <div class="image">
                            <img src="<%#Eval("product_image") %>" alt="">
                        </div>
                        <div class="content">
                            <h3><%#Eval("product_title") %></h3>
                            <div class="price">
                                <div class="amount"><%#Eval("product_price") %></div>
                                <div class="cut"><%#Eval("product_price_new") %></div>
                                <div class="offer"><%#Eval("product_promotions") %>% off</div>
                            </div>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(50)</span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </section>
    <section class="products" id="products_tre_em">

        <h1 class="heading">Đồ Trẻ Em </h1>

        <div class="box-container">
            <asp:Repeater runat="server" ID="rpProduct_tre">
                <ItemTemplate>
                    <div class="box" data-item="featured">
                        <div class="icons">
                            <a href="javascript:void(0)" onclick="getId(<%#Eval("product_id") %>)" class="fas fa-shopping-cart"></a>
                        </div>
                        <div class="image">
                            <img src="<%#Eval("product_image") %>" alt="">
                        </div>
                        <div class="content">
                            <h3><%#Eval("product_title") %></h3>
                            <div class="price">
                                <div class="amount"><%#Eval("product_price") %></div>
                                <div class="cut"><%#Eval("product_price_new") %></div>
                                <div class="offer"><%#Eval("product_promotions") %>% off</div>
                            </div>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(50)</span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </section>
    <div style="display: none">
        <input type="text" id="txtId" runat="server" name="name" value="" />
        <a href="#" runat="server" id="btnLuu" onserverclick="btnLuu_ServerClick">content</a>
    </div>
    <script>
        var listId = [];
        function getId(id) {
            listId.push(id);
            alert("đã thêm vào giõ hàng!");
        }
        function LuuData() {
            document.getElementById("<%=txtId.ClientID%>").value = listId.join(";");
            if (document.getElementById("<%=txtId.ClientID%>").value == "") {
                alert("Hãy chọn thứ mình muốn mua!");
            } else {
                document.getElementById("<%=btnLuu.ClientID%>").click();
            }
        }
    </script>
</asp:Content>

