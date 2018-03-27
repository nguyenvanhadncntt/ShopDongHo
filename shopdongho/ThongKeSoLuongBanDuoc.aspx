<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ThongKeSoLuongBanDuoc.aspx.cs" Inherits="ShopDongHo.ThongKeSoLuongBanDuoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style24">
        <tr>
            <td style="background-color: #333300" align="center"><h2>Thống kê số lượng bán được theo sản phẩm</h2></td>
        </tr>
        <tr>
            <td align="center" style="background-color: #99CCFF">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                        <asp:BoundField DataField="SOLUONGBAN" HeaderText="Số lượng đã bán" />
                        <asp:BoundField DataField="SOLUONGCONLAI" HeaderText="Số lượng còn lại" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="background-color: #333300" align="center"><h2>Thống kê số lượng sản phẩm bán được theo thương hiệu</h2></td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="TENNH" HeaderText="Tên nhóm hàng" />
                        <asp:BoundField DataField="MaNH" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="SOLUONGCONLAI" HeaderText="Số lượng còn lại" />
                        <asp:BoundField DataField="SOLUONGBAN" HeaderText="Số lượng đã bán" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
