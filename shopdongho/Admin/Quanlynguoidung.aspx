<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quanlynguoidung.aspx.cs" Inherits="Admin_Quanlynguoidung" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td 
                
                style="text-align: center; font-weight: 700; color: black; background-color: white">
                QUẢN LÝ NGƯỜI DÙNG</td>
        </tr>
        <tr>
            <td style="text-align: center; color: #0000FF;">
                &nbsp;<asp:Button ID="bt_tatca" runat="server" onclick="bt_tatca_Click" 
                    style="color: #0000FF; background-color: white" Text="Tất cả" />
&nbsp;
                <asp:Label ID="Label9" runat="server" Text="Nhập tên người dùng:"></asp:Label>
&nbsp;<asp:TextBox ID="txt_ten" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="bt_tim" runat="server" style="color: #0000FF; background-color: white" 
                    Text="Tìm" onclick="bt_tim_Click" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="grv_nguoidung" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MANGUOIDUNG" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MANGUOIDUNG" HeaderText="Mã người dùng" />
                            <asp:BoundField DataField="MAQUYEN" HeaderText="Mã quyền" />
                            <asp:BoundField DataField="TENDANGNHAP" HeaderText="Tên đăng nhập" />
                            <asp:BoundField DataField="MATKHAU" HeaderText="Mật khẩu" />
                            <asp:BoundField DataField="HOTEN" HeaderText="Họ tên" />
                            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btDelete" runat="server" Text="Xóa" onclick="btDelete_Click" 
                        style="color: #0000FF; background-color: #FF99FF"/>
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
            <td style="text-align: center">
                <table style="border: thin none #0000FF; width:100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="grv_kqnguoidung" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MANGUOIDUNG" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                   BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" 
                        onpageindexchanging="grv_kpnguoidung_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MANGUOIDUNG" HeaderText="Mã người dùng" />
                            <asp:BoundField DataField="MAQUYEN" HeaderText="Mã quyền" />
                            <asp:BoundField DataField="TENDANGNHAP" HeaderText="Tên đăng nhập" />
                            <asp:BoundField DataField="MATKHAU" HeaderText="Mật khẩu" />
                            <asp:BoundField DataField="HOTEN" HeaderText="Họ tên" />
                            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="bt_xoa" runat="server" Text="Xóa" 
                        style="color: #0000FF; background-color: white" onclick="bt_xoa_Click"/>
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
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label8" runat="server" Text="Quyền:"></asp:Label>
            </td>
            <td class="style12">
                <asp:DropDownList ID="drp_quyen" runat="server" Height="16px" Width="128px">
                </asp:DropDownList>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập:" CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_tendangnhap" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style22">
                Mật khẩu (&gt;= 6 kí tự):</td>
            <td class="style12">
                <asp:TextBox ID="txt_matkhau" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label3" runat="server" Text="Xác nhận mật khẩu:" 
                    CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_xacnhanmk" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label4" runat="server" Text="Họ tên:" CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_hoten" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label5" runat="server" Text="Địa chỉ:" CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_diachi" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label6" runat="server" Text="Số điện thoại:" CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_dienthoai" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style21">
                <asp:Label ID="Label7" runat="server" Text="Email:" CssClass="style20"></asp:Label>
            </td>
            <td class="style12">
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td  colspan="2" style="text-align: center">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td colspan="2" style="text-align: center; color: #0000FF;">
                <asp:CheckBox ID="chk_dongy" runat="server" style="color: #0000FF" />
&nbsp;<span class="style13">Tôi đồng ý tạo tài khoản</span></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bt_dangky" runat="server" style="font-weight: 700; color: #0000FF; background-color: white;" 
                    Text="Thêm" onclick="bt_dangky_Click" CssClass="style16" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; background-color: #93dafd">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        </table>&nbsp;</td>
        </tr>
        </table>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style20
        {
            color: #0000FF;
        }
        .style21
        {
            text-align: right;
            color: #0000FF;
        }
        .style22
        {
            color: #0000FF;
            text-align: right;
        }
    </style>
</asp:Content>



