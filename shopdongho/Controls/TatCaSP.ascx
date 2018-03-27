<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TatCaSP.ascx.cs" Inherits="ShopDongHo.Controls.TatCaSP" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 8px;
    }
    .auto-style3 {
        height: 2px;
    }
</style>

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
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ChiTietSP.aspx?msp=" +Eval("MaSP") %>' Text='<%# Eval("TenSP") %>' ForeColor="Blue"></asp:HyperLink>
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
 <center><div id="phanTrang" style="margin-top:30px"">
        <asp:Button ID="btnTrangDau" runat="server" Text="Trang đầu" ForeColor="#3333CC" Height="30px" OnClick="btnTrangDau_Click" Width="100px" />&nbsp; <asp:Button ID="btnTruoc" runat="server" Text="Trước" ForeColor="#3333CC" Height="30px" OnClick="btnTruoc_Click" Width="60px" />&nbsp; 
        <asp:Label ID="lbPhanTrang" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="21px" ForeColor="#000099"></asp:Label>
        &nbsp; <asp:Button ID="btnSau" runat="server" Text="Sau" ForeColor="#3333CC" Height="30px" OnClick="btnSau_Click" Width="60px" />&nbsp; <asp:Button ID="btnTrangCuoi" runat="server" Text="Trang Cuối" ForeColor="#6600FF" Height="30px" OnClick="btnTrangCuoi_Click" Width="100px" />
    </div> </center>


