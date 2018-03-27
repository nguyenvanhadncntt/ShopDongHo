<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongbaosoluong.aspx.cs" Inherits="Thongbaosoluong" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="text-align: justify; background-color: #93dafd;">
        <span class="style16"><em>Sản phẩm này hiện đang hết hàng, quý khách vui lòng quay lại sau!<br />
        Chúng tôi vẫn còn rất nhiều mặt hàng cho quý khách lựa chọn</em></span>&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Sanpham.aspx">Kính mời</asp:HyperLink>
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




