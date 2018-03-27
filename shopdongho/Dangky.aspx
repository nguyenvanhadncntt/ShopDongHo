<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="ShopDongHo.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style22 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table style="vertical-align: middle; background-color: #99CCFF;">
            <tr>
                <td >
                    <asp:Label ID="Label5" runat="server" Text="Họ và tên"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTenKH" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="Mật khẩu"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtMatKhau" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lb_mk" runat="server" Font-Overline="False" ForeColor="#CC0000" Font-Size="15pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Nhập lại mật khẩu"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtXacNhanMK" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lb_xnmk" runat="server" Font-Overline="False" ForeColor="#CC0000" Font-Size="15pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lable7" runat="server" Text="Địa chỉ"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDiaChi" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lb_email" runat="server" Font-Overline="False" ForeColor="#CC0000" Font-Size="15pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Số điện thoại"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSDT" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Giới Tinh"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlGioiTinh" runat="server" Height="16px" Width="300px" Style="vertical-align: central">
                        <asp:ListItem Value="1">Nữ</asp:ListItem>
                        <asp:ListItem Value="0">Nam</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" >
                    <asp:FileUpload ID="fuKhachHang" runat="server" OnLoad="fuKhachHang_Load" />
                </td>
                <td class="auto-style22">
                    <asp:Button ID="btnDangky" runat="server" Text="Đăng Ký" Width="91px" OnClick="btnDangky_Click" />
                    
                </td>
                <td class="auto-style22">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="3" align="center">
                    <asp:Label ID="lb_tb" runat="server" Font-Overline="False" ForeColor="#CC0000" Font-Size="15pt"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>
