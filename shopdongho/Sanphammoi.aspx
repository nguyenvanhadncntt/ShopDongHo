<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sanphammoi.aspx.cs" Inherits="Sanphammoi" MasterPageFile="MasterPage.master" %>

<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%;">
        <tr>
            <td>
<asp:DataList ID="DataList3" runat="server" RepeatColumns="2" 
    DataKeyField="MASP"
     BackColor="White" 
    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    GridLines="Vertical" Width="629px">
    <AlternatingItemStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <HeaderTemplate>
            <div align="center" style="text-align: left">
                <strong style="text-align: left">.......::&quot;SẢN PHẨM MỚI&quot;::.......</strong></div>
        </HeaderTemplate>
    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
    <ItemTemplate>
        <table style="width:102%;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lbTensanpham" runat="server" Text='<%#Eval("TENSP") %>' 
                        Font-Bold="True" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="style19" rowspan="3">
                    <asp:Image ID="Image1" runat="server" Height="90px" 
                        ImageUrl='<%# Eval("ANHSP") %>' Width="130px" />
                </td>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="text-align: left">
                    <asp:Label ID="Label4" runat="server" CssClass="style13" 
                        style="font-size: medium; color: #003366;" Text="Đơn giá:"></asp:Label>
                    &nbsp;<asp:Label ID="lbDongia" runat="server" CssClass="style13" 
                        style="font-size: medium; color: #0000FF;" 
                        Text='<%# String.Format("{0:0,0}",Eval("DONGIA")) +"đồng" %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <asp:Label ID="Label5" runat="server" CssClass="style13" 
                        style="font-size: medium; color: #003366;" Text="Số lượng:"></asp:Label>
                    &nbsp;<asp:Label ID="lbSoluong" runat="server" CssClass="style13" 
                        style="font-size: medium; color: #0000FF;" Text='<%# Eval("SOLUONG") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="style19">&nbsp;</td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:Button ID="btMua" runat="server" Text="Thêm vào giỏ" 
                         CommandArgument='<%# Eval("MASP")%>' onclick="btMua_Click" 
                        style="color: #0000FF; background-color: white" Height="20px" 
                         />
                         
                    &nbsp;
                    <asp:Button ID="bt_chitiet" runat="server" CommandArgument='<%# Eval("MASP")%>' 
                       onclick="bt_chitiet_Click" Text=" Chi tiết..." CssClass="style3" 
                        Height="20px" />
                         
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
</asp:DataList>
                        </td>
        </tr>
        <tr>
            <td>
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






                        </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
                        <style type="text/css">

                            .style19
                            {
                                width: 125px;
                            }
        </style>
</asp:Content>



