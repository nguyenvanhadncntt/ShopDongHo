<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimKiemSanPham.aspx.cs" ValidateRequest="true" MasterPageFile="MasterPage.master" Inherits="TimKiemSanPham" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:DataList ID="DataList1" runat="server" Width="101%" DataKeyField="MASP" 
        BackColor="White" BorderColor="#999999" BorderStyle="Groove" BorderWidth="1px" 
        CellPadding="3" GridLines="Vertical" RepeatColumns="2">
        <AlternatingItemStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <div align="center" style="text-align: left">
                <strong>.......::&quot;KẾT QUẢ TÌM KIẾM&quot;::.......</strong></div>
        </HeaderTemplate>
        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lbltensp" runat="server" 
                            Text='<%# Eval("TENSP") %>' style="color: #FF0000" />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style16" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="83px" 
                            ImageUrl='<%# Eval("ANHSP") %>' Width="106px" />
                    </td>
                    <td align="center">
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
                            CssClass="style10" style="color: #0000FF; background-color: white"/>
                    
                        &nbsp;
                        <asp:Button ID="btChitiet" runat="server" 
                            ForeColor="#993399" 
                            CommandArgument='<%#Eval("MASP")%>' Text="Chi tiết" 
                            Width="78px" CssClass="style10" 
                            style="color: #0000FF; background-color: white" 
                            onclick="btChitiet_Click" /></td>
                </tr>
            </table>
<br />
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
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VANPHONGPHAMConnectionString %>" 
        SelectCommand="timsptheoten" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="TENSP" QueryStringField="tukhoa" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style13
        {
        }
        .style14
        {
            width: 94px;
        }
        .style16
        {
            width: 109px;
        }
    </style>
</asp:Content>

