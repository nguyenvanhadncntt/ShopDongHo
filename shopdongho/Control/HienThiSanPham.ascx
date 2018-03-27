<%@ Control Language="C#" AutoEventWireup="true"CodeFile="HienThiSanPham.ascx.cs" Inherits="Control_HienThiSanPham" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<style type="text/css">
    .style3
    {
        color: #0000FF;
        background-color: white;
    }
    .style5
    {
        width: 247px;
    }
    .style6
    {
        width: 133px;
    }
    </style>
<body style="text-align: center">
<asp:DataList ID="DataList1" runat="server" RepeatColumns="2" 
    DataKeyField="MASP"
    onitemcommand="DataList1_ItemCommand" BackColor="White" 
    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    GridLines="Vertical" Width="640px">
    <AlternatingItemStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <HeaderTemplate>
            <div align="center" style="text-align: left">
                <strong>DANH MỤC SẢN PHẨM</strong></div>
        </HeaderTemplate>
    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
    <ItemTemplate>
        <table style="width:98%;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lbTensanpham" runat="server" Text='<%# Eval("TENSP") %>' 
                        Font-Bold="True" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" rowspan="4" class="style6">
                    <asp:Image ID="Image1" runat="server" Height="90px" 
                        ImageUrl='<%# Eval("ANHSP") %>' Width="129px" />
                </td>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-decoration: blink; text-align: left;">
                    <asp:Label ID="Label1" runat="server" CssClass="style5" Text="Nhóm hàng:"></asp:Label>
                    &nbsp;<asp:LinkButton ID="lnkbtnTENNH" runat="server" 
                        CommandArgument='<%#Eval("TENNH") %>' CommandName="lnkbtnNH" 
                        ForeColor="#33CC33" style="color: #0066FF" Text='<%# Eval("TENNH") %>'></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <asp:Label ID="Label2" runat="server" CssClass="style5" Text="Đơn giá:"></asp:Label>
                    &nbsp;<asp:Label ID="lbDongia" runat="server" CssClass="style5" 
                        Text='<%# String.Format("{0:0,0}",Eval("DONGIA")) +"đồng" %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <asp:Label ID="Label3" runat="server" CssClass="style5" Text="Số lượng:"></asp:Label>
                    &nbsp;<asp:Label ID="lbSoluong" runat="server" CssClass="style5" 
                        Text='<%# Eval("SOLUONG") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:Button ID="btMua" runat="server" Text="Thêm vào giỏ" 
                         CommandArgument='<%# Eval("MASP")%>' onclick="btMua_Click" 
                        style="color: #0000FF; background-color: white" Height="20px" 
                         />
                         
                    &nbsp;
                    <asp:Button ID="bt_chitiet" runat="server" CommandArgument='<%# Eval("MASP")%>' 
                       onclick="bt_chitiet_Click" Text=" Chi tiết" CssClass="style3" 
                        Height="20px" />
                         
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
</asp:DataList>
<cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="<< Trước" 
                    FirstText="Đầu" LabelText="Trang:" LastText="Cuối" NextText="Sau >>" 
                    ResultsFormat="Kết quả từ {0}-{1} (của {2}) " ShowFirstLast="True" 
                    SliderSize="10" PagingMode="PostBack" BackNextDisplay="Buttons" 
                    BackNextLinkSeparator="•" HideOnSinglePage="True" IgnoreQueryString="False" 
                    PageNumbersDisplay="Numbers" PageSize="10" ResultsLocation="Top" 
                    SectionPadding="10" ShowLabel="True" ShowPageNumbers="True" UseSlider="True" 
                    BackNextLocation="Split" LabelStyle="" ControlStyle="color:Blue" 
                    PageNumbersStyle="color:Blue" PageNumberStyle="">
     </cc1:CollectionPager>






<div>
</div>







