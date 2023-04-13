<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_SanPhamYeuThich.aspx.cs" Inherits="web_module_module_SanPhamYeuThich" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        .card-img-ega:hover {
            box-shadow: 0px 1px 24px 0px #00000028;
            border-radius: 90px;
            transform: scale(1.1);
        }

        .card-ega {
            display: grid;
            justify-items: center;
        }

            .card-ega h5 {
                font-weight: 500;
                margin: 0px;
                padding: 0px
            }

            .card-ega span {
                color: #888;
            }

        .card-giamgia h5 {
            color: #F58A20;
            margin-bottom: 0px !important;
            padding: 0px !important;
            font-size: 15px;
        }

        .card-giamgia span {
            font-size: 15px
        }

        .card-giamgia {
            margin: 0px;
        }

        .card-giamgia-copy {
            background-color: #F58A20;
            /*padding: 5px;*/
            color: white;
            font-size: 13px;
            padding: 4px;
        }

        .card-giamgia-dk {
            font-size: 13px;
            color: #888;
        }

        .card-hanghieu h3 {
            font-weight: 400;
        }

        .card-hanghieu-title {
            color: black;
            font-size: 20px;
            font-weight: 600;
        }

            .card-hanghieu-title:hover {
                color: #123cc9;
                text-decoration: none;
                font-weight: 500;
            }

        .card-hanghieu-loai {
            font-size: 15px;
            color: #888;
            font-weight: 500;
        }

        .card-hanghieu-gianew {
            color: orangered;
            font-size: 17px;
            font-weight: 500;
        }

        .card-hanghieu-gia {
            font-size: 15px;
            color: #888;
            text-decoration: line-through;
            font-weight: 500;
        }

        .card-xemtatca {
            background-color: white;
            box-shadow: 0px 1px 24px 0px #00000028;
            font-size: 17px;
            padding: 8px 22px;
            border-radius: 9px;
            color: #F58A20;
            border-style: solid;
            border-color: #F58A20;
            font-weight: 400;
        }

            .card-xemtatca:hover {
                color: white;
                background-color: #F58A20;
                text-decoration: none
            }

        .fa-tim {
            position: absolute;
            z-index: 1;
            top: 6%;
            left: 10%;
            font-size: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <br />
        <div class="row">
            <asp:Repeater runat="server" ID="rpSpyt">
                <ItemTemplate>
                    <div class="col-3 p-2">
                        <a href="#" style="<%#Eval("color") %>" onclick="getLike(<%#Eval("product_id") %>)">
                                    <i class="fa fa-heart-o fa-tim" aria-hidden="true"></i>
                                </a>
                        <a href="/san-pham-<%#Eval("product_id") %>">
                            <div class="card p-2">
                                <img src="../images_SanPham/<%#Eval("product_image") %>" alt="Alternate Text" />
                            </div>
                        </a>
                        <div style="display: grid; margin-top: 10px">
                            <span class="card-hanghieu-loai"><%#Eval("city_name") %></span>
                            <a href="/san-pham-<%#Eval("product_id") %>" class="card-hanghieu-title"><%#Eval("product_title") %></a>
                            <span class="card-hanghieu-gianew"><%#Eval("product_price_new") %> đ</span>
                            <span class="card-hanghieu-gia"><%#Eval("product_price") %> đ</span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="display: none">
            <input type="text" id="txtLike" runat="server" name="name" value="" />
            <a href="#" runat="server" id="btnLike" onserverclick="btnLike_ServerClick">content</a>
            <script>
                function getLike(id) {
                    document.getElementById("<%=txtLike.ClientID%>").value = id;
                    document.getElementById("<%=btnLike.ClientID%>").click();
                }
            </script>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

