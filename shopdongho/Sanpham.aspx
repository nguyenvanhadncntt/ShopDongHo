<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sanpham.aspx.cs" Inherits="Sanpham" MasterPageFile="MasterPage.master" %>


<%@ Register src="Control/HienThiSanPham.ascx" tagname="HienThiSanPham" tagprefix="uc1" %>



<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <uc1:HienThiSanPham ID="HienThiSanPham1" runat="server" />
</asp:Content>



