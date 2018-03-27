<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongbaodangnhap.aspx.cs" Inherits="Thongbaodangnhap" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width:100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: center">
                <span class="style16"><em>Kính mời quý khách</em></span>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Dangnhap.aspx">Đăng nhập</asp:HyperLink>
&nbsp;&nbsp;<span class="style16"><em>để tiếp tục mua hàng</em></span></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <span class="style16"><em>Nếu chưa có tài khoản xin mời</em></span>&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Dangky.aspx">Click vào đây</asp:HyperLink>
&nbsp;<span class="style16"><em style="text-align: center">để đăng ký</em></span></td>
        </tr>
        </table>
</asp:Content>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style16
        {
            color: #000000;
        }
        .style17
        {
            height: 23px;
        }
    </style>
</asp:Content>




