<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="ChiTietSP.aspx.cs" Inherits="ShopDongHo.ChiTietSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            height: 39px;
        }
        .auto-style26 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="0" class="auto-style1" style="background-color: #99FFCC">
        <tr>
            <td align="center" class="auto-style23" style="background-color: #0033CC"><strong>CHI TIẾT SẢN PHẨM</strong></td>
        </tr>
        </table>
    <table align="center" style="width: 100%">
        <tr>
            <td align="center">
                <asp:Image ID="img" runat="server" Height="165px" Width="212px" />
            </td>
        </tr>
        <tr>
            <td align="center" class="auto-style26">Tên sản phẩm:<asp:Label ID="lb_tensp" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style26" align="center">Thương hiệu:<asp:HyperLink ID="hpk_th" runat="server">[hpk_th]</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="center">Số Lượng còn lại:<asp:Label ID="lb_sl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">Đơn giá:<asp:Label ID="lb_dg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="kick" runat="server" ForeColor="Black" Text="Thêm vào giỏ" Width="123px" BackColor="Yellow" OnClick="kick_Click1" />
            </td>
        </tr>
        <tr>
            <td>Chi tiết:<asp:Label ID="lb_ct" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
