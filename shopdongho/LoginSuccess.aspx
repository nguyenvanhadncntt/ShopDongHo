<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="LoginSuccess.aspx.cs" Inherits="ShopDongHo.LoginSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style22 {
            width: 100%;
        }
        .auto-style23 {
            height: 165px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style22" style="background-color: #99CCFF">
        <tr>
            <td align="center">Xin chào&nbsp;
                <asp:Label ID="name" runat="server" Font-Bold="True"></asp:Label>
            &nbsp;,cảm ơn bạn đã đến với website của chúng tôi!!!</td>
        </tr>
        <tr>
            <td class="auto-style23" align="center">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/Rainbow-color-animated-hello.gif" />
                <br />
                <br />
                Bạn hãy kick
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/TrangChu.aspx"><i>vào đây</i></asp:HyperLink> &nbsp;để về lại trang chủ
            </td>
        </tr>
    </table>
</asp:Content>
