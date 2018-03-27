<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="LichSuMuaHang.aspx.cs" Inherits="ShopDongHo.LichSuMuaHang" %>
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
            <td style="background-color: #FF6600" align ="center"><h2>LỊCH SỬ MUA HÀNG</h2></td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TenSP" HeaderText="TÊN SẢN PHẨM" />
                        <asp:BoundField DataField="SOLUONG" HeaderText="SỐ LƯỢNG" />
                        <asp:BoundField DataField="DONGIA" HeaderText="ĐƠN GIÁ" />
                        <asp:BoundField DataField="NgayDat" HeaderText="NGÀY ĐẶT HÀNG" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
