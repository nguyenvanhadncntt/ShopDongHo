<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="DatHang.aspx.cs" Inherits="ShopDongHo.DatHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Center>        Đơn hàng đang được xử lý bạn hãy kick&nbsp;
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/TrangChu.aspx"><i>vào đây</i></asp:HyperLink>
&nbsp; để trở về trang chủ</Center>

</asp:Content>
