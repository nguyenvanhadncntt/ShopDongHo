<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="QuanLy_SP.aspx.cs" Inherits="ShopDongHo.QuanLy_SP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" style="text-align: center; color: black; font-weight: 700; background-color: white">QUẢN LÝ SẢN PHẨM</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; color: #0000FF;">
                <asp:TextBox ID="btn_tk" runat="server" Width="140px">Nhập tến sp</asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Button ID="bt_tim" runat="server" CssClass="style21" onclick="bt_tim_Click" Text="Tìm" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanging="select" AllowPaging="True" AllowSorting="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="MaSP" HeaderText="Mã SP" />
                            <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                            <asp:BoundField DataField="MaNH" HeaderText="Mã nhóm" />
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                            <asp:BoundField DataField="CHITIET" HeaderText="Chi tiết" />
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                            <asp:BoundField DataField="NGAYCAPNHAP" HeaderText="Ngày nhập" />
                            <asp:BoundField DataField="ANHSP" HeaderText="Đường dẫn ảnh" />
                            <asp:ImageField DataImageUrlField="ANHSP" DataImageUrlFormatString="{0}" HeaderText="Ảnh">
                                <ControlStyle Height="150px" Width="150px" />
                            </asp:ImageField>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 30px">
            </td>
            <td style="height: 30px">
                <asp:Button ID="Button2" runat="server" Text="Thêm mới nhóm SP" OnClick="Button2_Click" />
            </td>
            <td>
                <asp:Panel ID="panel_nhom" runat="server" Visible="False">
                    Mã nhóm :<asp:TextBox ID="tb_mn" runat="server"></asp:TextBox>
                    <br />
                    Tên nhóm:<asp:TextBox ID="tb_tn" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="bt_themnh" runat="server" Text="Thêm" OnClick="bt_themnh_Click" />
                    <asp:Button ID="btn_cancel" runat="server" OnClick="btn_cancel_Click" Text="Cancel" />
                    <br />
                    <asp:Label ID="tb" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label7" runat="server" Text="Mã sản phẩm:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_masp" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label1" runat="server" Text="Tên sản phẩm:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_tensp" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label2" runat="server" Text="Nhóm hàng:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drp_nhomhang" runat="server" Width="155px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label3" runat="server" Text="Ảnh sản phẩm:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="ful_anhsp" runat="server" style="color: #0000FF; background-color: #FFFFFF" Width="214px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label4" runat="server" Text="Số lượng:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_soluong" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label5" runat="server" Text="Chi tiết:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_chitiet" runat="server" Height="144px" TextMode="MultiLine" Width="381px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label6" runat="server" Text="Đơn giá:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_dongia" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bt_capnhat" runat="server" CssClass="style21" onclick="bt_capnhat_Click" Text="Cập nhật" />
                <asp:Button ID="bt_them" runat="server" CssClass="style21" onclick="bt_them_Click" Text="Thêm" />
                &nbsp;<asp:Button ID="btn_xoa" runat="server" onclick="bt_up_Click" style="color: #0000FF; background-color: white" Text="Xóa" Width="45px" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style20">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
