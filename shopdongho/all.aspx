<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="all.aspx.cs" Inherits="ShopDongHo.all" %>
<%@ Register src="Controls/TatCaSP.ascx" tagname="TatCaSP" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td style="background-color: #00FFFF" align="center"><b>TẤT CẢ SẢN PHẨM</b></td>
        </tr>
        <tr>
            <td>
                <uc1:TatCaSP ID="TatCaSP1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
