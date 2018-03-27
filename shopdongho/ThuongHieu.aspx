<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="ThuongHieu.aspx.cs" Inherits="ShopDongHo.ThuongHieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
    <AlternatingItemStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
    <ItemTemplate>
        <table class="auto-style1" style="width: 100%">
            <tr>
                <td rowspan="5" VALIGN="TOP" class="auto-style2">
                    <asp:Image ID="Image1" runat="server" Height="110px" Width="100px" ImageUrl='<%# Eval("ANHSP") %>' />
                </td>
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ChiTietSP.aspx?msp=" +Eval("MaSP") %>' Text='<%# Eval("TenSP") %>' ForeColor="Blue"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>Thương hiệu:<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" NavigateUrl='<%# "ThuongHieu.aspx?mn="+Eval("MANH") %>' Text='<%# Eval("TENNH") %>'></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>Số lượng
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SOLUONG") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Đơn giá
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text='<%# Eval("DONGIA")+"VNĐ" %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="kick" runat="server" BackColor="Yellow" CommandArgument='<%# Eval("MaSP")%>' OnClick="kick_Click" Text="Thêm vào giỏ" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
</asp:DataList>
</asp:Content>
