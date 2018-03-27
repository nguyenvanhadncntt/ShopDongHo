<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="Dangnhap" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="border: thin outset #0000FF; width:100%; background-color: #93dafd;">
    <tr>
        <td colspan="4" 
            
            style="text-align: center; color: black; background-color: white; font-weight: 700;">
            ĐĂNG NHẬP HỆ THỐNG</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13">
            &nbsp;</td>
        <td style="text-align: left" class="style22">
            <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập:" CssClass="style21"></asp:Label>
        </td>
        <td style="text-align: left" class="style23">
            <asp:TextBox ID="txt_tendangnhap" runat="server" Width="141px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            </td>
        <td style="text-align: left" class="style22">
            <asp:Label ID="Label2" runat="server" Text="Mật khẩu:" CssClass="style21"></asp:Label>
        </td>
        <td style="text-align: left" class="style23">
            <asp:TextBox ID="txt_matkhau" runat="server" TextMode="Password" Width="142px">Mật khẩu</asp:TextBox>
        </td>
        <td class="style19">
            </td>
    </tr>
    <tr>
        <td class="style13">
            &nbsp;</td>
        <td class="style22">
            &nbsp;</td>
        <td class="style23">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Button ID="bt_dangnhap" runat="server" Text="Đăng nhập" 
                onclick="bt_dangnhap_Click" style="font-weight: 700" CssClass="style20" />
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Label ID="lbl_thongbao" runat="server" 
                style="text-align: center; color: #FF0000;"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Quenmatkhau.aspx">[Quên mật khẩu]</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Dangky.aspx">[Đăng ký]</asp:HyperLink>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style13
        {
        }
        .style14
        {
        }
        .style15
        {
            width: 132px;
        }
        .style16
        {
            width: 135px;
            height: 26px;
        }
        .style19
        {
            height: 26px;
        }
        .style20
        {
            color: #0000FF;
            background-color: white;
        }
        .style21
        {
            color: #0000FF;
        }
        .style22
        {
            width: 100px;
        }
        .style23
        {
            width: 142px;
        }
    </style>
</asp:Content>


