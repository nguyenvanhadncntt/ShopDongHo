<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ShopDongHo.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </h1>
<p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaHD,MaSP" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="MaHD" HeaderText="MaHD" ReadOnly="True" SortExpression="MaHD" />
                <asp:BoundField DataField="MaSP" HeaderText="MaSP" ReadOnly="True" SortExpression="MaSP" />
                <asp:BoundField DataField="SOLUONG" HeaderText="SOLUONG" SortExpression="SOLUONG" />
                <asp:BoundField DataField="DONGIA" HeaderText="DONGIA" SortExpression="DONGIA" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:phukiennuConnectionString %>" SelectCommand="SELECT * FROM [CHITIETDH]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
