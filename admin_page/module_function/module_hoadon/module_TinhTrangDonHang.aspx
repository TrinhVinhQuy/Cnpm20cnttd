<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_TinhTrangDonHang.aspx.cs" Inherits="admin_page_module_access_admin_UserManage" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script type="text/javascript">
        function func() {
            grvList.Refresh();
            popupControl.Hide();
        }
        function btnChiTiet() {
            document.getElementById('<%=btnChiTiet.ClientID%>').click();
        }
        function checkNULL() {
            <%--//var CityName = document.getElementById('<%= txtTenNV.ClientID%>');--%>

            if (CityName.value.trim() == "") {
                swal('Tên nhân viên không được để trống!', '', 'warning').then(function () { CityName.focus(); });
                return false;
            }
            return true;
        }
        <%--function confirmDel() {
            swal("Bạn có thực sự muốn xóa?",
                "Nếu xóa, dữ liệu sẽ không thể khôi phục.",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var xoa = document.getElementById('<%=btnXoa.ClientID%>');
                        xoa.click();
                    }
                });
        }--%>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false; return true;
        };
    </script>
   
    <div class="card card-block">
        <div class="form-group row">
            <div class="col-sm-10">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <%--<asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary " OnClick="btnThem_Click" />--%>
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <%--<input type="submit" class="btn btn-primary " value="Xóa" onclick="confirmDel()" />--%>
                        <%--<asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="hoadon_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="2%">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Tên khách hàng" FieldName="khachhang_name" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Địa chỉ" FieldName="customer_address" HeaderStyle-HorizontalAlign="Center" Width="30%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Số ĐT" FieldName="customer_phone" HeaderStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Mã hoá đơn" FieldName="hoadon_id" HeaderStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Tổng tiền" FieldName="hoadon_tongtien" HeaderStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Tình Trạng" FieldName="hoadon_tinhtrang" HeaderStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Ngày mua" FieldName="hoadon_giothanhtoan" HeaderStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="btnChiTiet" />
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gỏ từ cần tìm kiếm và enter..." />
                <SettingsLoadingPanel Text="Đang tải..." />
                <SettingsPager PageSize="20" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
        
    </div>
    <dx:ASPxPopupControl ID="popupControl" runat="server" Width="500px" Height="450px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupControl" ShowFooter="true"
        HeaderText="ĐĂNG KÝ THÔNG TIN" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){grvList.Refresh();}">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="udPopup" runat="server">
                    <ContentTemplate>
                        <div class="popup-main">
                            <div class="div_content col-12">
                                <div class="col-12">
                                    <div class="col-12">
                                        <dx:ASPxGridView ID="grvHDCT" runat="server" ClientInstanceName="grvList" KeyFieldName="hoadon_id" Width="100%">
                                            <Columns>
                                                <dx:GridViewDataColumn Caption="Tên sản phẩm" FieldName="product_title" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                                                <dx:GridViewDataColumn Caption="Số lượng" FieldName="hdct_soluong" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                                                <dx:GridViewDataColumn Caption="Đơn giá" FieldName="hdct_price" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                                            </Columns>
                                            <ClientSideEvents RowDblClick="btnChiTiet" />
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsBehavior AllowFocusedRow="true" />
                                            <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gỏ từ cần tìm kiếm và enter..." />
                                            <SettingsLoadingPanel Text="Đang tải..." />
                                            <SettingsPager PageSize="20" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
                                        </dx:ASPxGridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <div class="mar_but button">
                <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Duyệt đơn" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
                <asp:Button ID="btnThanhToan" runat="server" ClientIDMode="Static" Text="Duyệt thanh toán" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnThanhToan_Click" />
            </div>
        </FooterContentTemplate>
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

