<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="ShopDongHo.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style24 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style24">
        <tr>
            <td style="background-color: #33CC33" align="center"><h2>ĐỔI MẬT KHẨU</h2></td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <asp:Label ID="Label1" runat="server" Text="Mật khẩu cũ:"></asp:Label>
                &nbsp;<asp:TextBox ID="txt_mkcu" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu mới:"></asp:Label>
                <asp:TextBox ID="txt_mkmoi" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <h1><asp:Label runat="server" ID="lb_ma"></asp:Label></h1>    
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <asp:Label ID="Label3" runat="server" Text="Nhập lại đoạn mã ở trên:"></asp:Label>
                <asp:TextBox ID="txt_maxn" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <asp:Button ID="btn_xn" runat="server" OnClick="btn_xn_Click" Text="Xác nhận" />
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color: #3399FF">
                <asp:Label ID="error" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
