<%@ Page Language="C#" AutoEventWireup="true" CodeFile="timsptheogia.aspx.cs" Inherits="timsptheogia" MasterPageFile="~/MasterPage.master" %>


<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%;">
    <tr>
        <td colspan="3" style="text-align: center">
    <asp:DataList ID="DataList2" runat="server" Width="101%" DataKeyField="MASP" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="Groove" BorderWidth="1px" 
        CellPadding="4" GridLines="Horizontal" RepeatColumns="2">
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderTemplate>
            <div align="center" style="text-align: left">
                <strong>KẾT QUẢ </strong></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <ItemTemplate>
            <table style="width:102%;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lbltensp" runat="server" style="color: #FF0000" 
                            Text='<%# Eval("TENSP") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style16" rowspan="4">
                        <asp:Image ID="Image1" runat="server" Height="86px" 
                            ImageUrl='<%# Eval("ANHSP") %>' Width="104px" />
                    </td>
                    <td align="center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" style="text-align: left">
                        <asp:Label ID="Label1" runat="server" Text="Đơn giá:"></asp:Label>
                        &nbsp;<asp:Label ID="lbldongia" runat="server" style="color: #0000FF" 
                            Text='<%# Eval("DONGIA") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="text-align: left">
                        <asp:Label ID="Label2" runat="server" Text="Số lượng:"></asp:Label>
                        &nbsp;<asp:Label ID="lblsoluong" runat="server" style="color: #0000FF" 
                            Text='<%# Eval("SOLUONG") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" style="text-align: center" colspan="2">
                        <asp:Button ID="btMua" runat="server" Text="Thêm vào giỏ" ForeColor="#993399"
                            CommandArgument='<%#Eval("MASP")%>' onclick="btMua_Click" 
                            CssClass="style13" style="background-color: white"/>
                        &nbsp;<asp:Button ID="btChitiet" runat="server" 
                            ForeColor="#993399" 
                           CommandArgument='<%#Eval("MASP")%>' Text="Chi tiết" 
                            Width="78px" CssClass="style13" 
                            style="background-color: white" onclick="btChitiet_Click2" />
                    </td>
                </tr>
            </table>
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
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
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">

        .style14
    {
        width: 131px;
    }
    </style>
    <style type="text/css">
        .style13
        {
            color: #0000FF;
            background-color: #FF99FF;
        }
    </style>
    <style type="text/css">
        .style16
        {
            width: 116px;
        }
    </style>
</asp:Content>



