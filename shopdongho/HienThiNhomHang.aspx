<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HienThiNhomHang.aspx.cs" ValidateRequest="true" MasterPageFile="~/MasterPage.master" Inherits="TrangChu" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<%@ Register src="Control/HienThiSanPham.ascx" tagname="HienThiSanPham" tagprefix="uc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
<asp:DataList ID="DataList1" runat="server" RepeatColumns="2" 
    DataKeyField="MASP"
    onitemcommand="DataList1_ItemCommand" BackColor="White" 
    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    GridLines="Vertical" Width="632px">
    <AlternatingItemStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <HeaderTemplate>
            <div align="center" style="text-align: left">
                <strong>DANH MỤC SẢN PHẨM THEO NHÓM</strong></div>
        </HeaderTemplate>
    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
    <ItemTemplate>
        <table style="width:98%;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lbTensanpham" runat="server" Text='<%#Eval("TENSP") %>' 
                        Font-Bold="True" CssClass="style13" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="style17" rowspan="3">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ANHSP") %>' 
                        Height="90px" Width="119px" />
                </td>
                <td align="center">
                    &nbsp;</td>
            </tr>
        
            <tr>
                <td align="left" style="text-align: left">
                    <asp:Label ID="Label4" runat="server" CssClass="style18" 
                        style="font-size: medium" Text="Đơn giá:"></asp:Label>
                    &nbsp;<asp:Label ID="lbDongia" runat="server" CssClass="style13" 
                        style="font-size: medium" 
                        Text='<%# String.Format("{0:0,0}",Eval("DONGIA")) +"đồng" %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="text-align: left">
                    <asp:Label ID="Label5" runat="server" CssClass="style18" 
                        style="font-size: medium" Text="Số lượng:"></asp:Label>
                    &nbsp;<asp:Label ID="lbSoluong" runat="server" CssClass="style13" 
                        style="font-size: medium" Text='<%# Eval("SOLUONG") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="text-align: center" colspan="2">
                    <asp:Button ID="btMua" runat="server" Text="Thêm vào giỏ" 
                         CommandArgument='<%# Eval("MASP")%>' onclick="btMua_Click" 
                        CssClass="style10" style="color: #0000FF; background-color: white" />
                      
                    <asp:Button ID="bt_chitiet" runat="server" CommandArgument='<%# Eval("MASP")%>' 
                        onclick="bt_chitiet_Click" Text=" Chi tiết..." CssClass="style10" 
                        style="color: #0000FF; background-color: white" />
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

</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style14
        {
            width: 124px;
        }
        .style17
        {
            width: 93px;
        }
        .style18
        {
            color: #9900CC;
        }
    </style>
</asp:Content>


