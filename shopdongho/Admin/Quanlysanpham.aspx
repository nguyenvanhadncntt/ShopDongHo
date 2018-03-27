<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quanlysanpham.aspx.cs" Inherits="Admin_Quanlysanpham" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" style="text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" 
                style="text-align: center; color: black; font-weight: 700; background-color: white">
                QUẢN LÝ SẢN PHẨM</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; color: #0000FF;">
                &nbsp;<asp:Button ID="bt_tatcasp" runat="server" onclick="bt_tatcasp_Click" 
                    style="color: #0000FF; background-color: white" Text="Tất cả sp" />
&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Text="Nhóm hàng:"></asp:Label>
&nbsp;<asp:DropDownList ID="drp_manh" runat="server" Height="21px" Width="142px">
                </asp:DropDownList>
&nbsp;<asp:Button ID="bt_tim" runat="server" CssClass="style21" onclick="bt_tim_Click" 
                    Text="Tìm" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:GridView ID="grv_sanpham" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MASP" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MASP" HeaderText="Mã SP" />
                            <asp:BoundField DataField="TENSP" HeaderText="Tên SP" />
                            <asp:BoundField DataField="TENNH" HeaderText="Tên NH" />
                            <asp:BoundField DataField="ANHSP" HeaderText="Ảnh SP" />
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                            <asp:BoundField DataField="CHITIET" HeaderText="Chi tiết" />
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;<asp:Button ID="bt_sua" runat="server" onclick="bt_sua_Click" 
                        style="color: #0000FF; background-color: white" Text="Sửa" />
                                    &nbsp;
                                    <asp:Button ID="btDelete" runat="server" Text="Xóa" onclick="btDelete_Click" 
                        style="color: #0000FF; background-color: white"/>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Chọn
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_Check" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <asp:GridView ID="grv_sp" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MASP" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                     BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" onpageindexchanging="grv_sp_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MASP" HeaderText="Mã SP" />
                            <asp:BoundField DataField="TENSP" HeaderText="Tên SP" />
                            <asp:BoundField DataField="TENNH" HeaderText="Tên NH" />
                            <asp:BoundField DataField="ANHSP" HeaderText="Ảnh SP" />
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                            <asp:BoundField DataField="CHITIET" HeaderText="Chi tiết" />
                            <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;<asp:Button ID="bt_s" runat="server" 
                        style="color: #0000FF; background-color: white" Text="Sửa" onclick="bt_s_Click" />
                                    &nbsp;
                                    <asp:Button ID="bt_x" runat="server" Text="Xóa"  
                        style="color: #0000FF; background-color: white" onclick="bt_x_Click"/>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Chọn
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_Check0" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label1" runat="server" Text="Tên sản phẩm:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_tensp" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label2" runat="server" Text="Nhóm hàng:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drp_nhomhang" runat="server" Width="155px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label3" runat="server" Text="Ảnh sản phẩm:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="ful_anhsp" runat="server" 
                    style="color: #0000FF; background-color: #FFFFFF" Width="214px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label4" runat="server" Text="Số lượng:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_soluong" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label5" runat="server" Text="Chi tiết:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_chitiet" runat="server" Width="381px" Height="144px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                <asp:Label ID="Label6" runat="server" Text="Đơn giá:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_dongia" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bt_capnhat" runat="server" CssClass="style21" 
                    onclick="bt_capnhat_Click" Text="Cập nhật" Visible="False" />
                <asp:Button ID="bt_them" runat="server" CssClass="style21" 
                    onclick="bt_them_Click" Text="Thêm" />
            &nbsp;<asp:Button ID="bt_up" runat="server" onclick="bt_up_Click" 
                    style="color: #0000FF; background-color: white" Text="Cập nhật" 
                    Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .style20
    {
            width: 161px;
            text-align: right;
            color: #0000FF;
            margin-left: 2040px;
        }
        .style21
        {
            color: #0000FF;
            background-color: white;
        }
    </style>
</asp:Content>



