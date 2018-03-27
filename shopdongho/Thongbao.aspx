<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongbao.aspx.cs" Inherits="Thongbao" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="text-align: justify; background-color: #93dafd">
        <span class="style16"><em>Sản phẩm này quý khách vừa đặt mua những chiếc cuối 
        cùng nên hiện tại sản phẩm không còn hàng để cung cấp.</em></span><br />
        <span class="style16"><em>Quý khách có thể lựa chọn các sản phẩm khác của chúng 
        tôi</em></span> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Sanpham.aspx">Ở đây</asp:HyperLink>
    &nbsp;
    </div>
</asp:Content>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style16
        {
            color: #000000;
        }
    </style>
</asp:Content>




