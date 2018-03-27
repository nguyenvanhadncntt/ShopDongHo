<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="CapNhapThongTinCaNhan.aspx.cs" Inherits="ShopDongHo.CapNhapThongTinCaNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <Strong>Tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </Strong><asp:TextBox ID="tb_ten" runat="server"></asp:TextBox><br />
        <Strong>Giới tính:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</Strong><asp:TextBox ID="tb_gt" runat="server"></asp:TextBox><br />
        <Strong>Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </Strong><asp:TextBox ID="tb_dc" runat="server"></asp:TextBox><br />
        <Strong>Số điện thoại:&nbsp; </Strong><asp:TextBox ID="tb_sdt" runat="server"></asp:TextBox><br />
        <Strong>Ảnh đại diện: </Strong><asp:FileUpload ID="fu" runat="server"></asp:FileUpload>
        <br />
        <br />
<asp:Label ID="lb_tb" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btn_cn" runat="server" Text="Cập nhật" Width="82px" OnClick="btn_cn_Click" />
        <br />
    </center>
</asp:Content>
