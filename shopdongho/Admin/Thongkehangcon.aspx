<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongkehangcon.aspx.cs" Inherits="Admin_Thongkehangcon" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: right; background-color: #FFFFFF" colspan="15">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td 
                
                
                
                style="text-align: center; font-weight: 700; color: black; background-color: white" 
                colspan="15">
                THỐNG KÊ SẢN PHẨM CÒN HÀNG</td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="15">
                <asp:Button ID="bt_tatca" runat="server" onclick="bt_tatca_Click" 
                    style="color: #0000FF; background-color: white" Text="Tất cả" 
                    Visible="False" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center" colspan="3">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="grv_hangcon" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="TENNH" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" ShowFooter="True">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="TENNH" HeaderText="Nhóm hàng" />
                            <asp:BoundField DataField="SOLUONGCON" HeaderText="Số lượng còn" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;<asp:Button ID="bt_chitiet" runat="server" onclick="bt_sua_Click" 
                        style="color: #0000FF; background-color: white" Text="Chi tiết" />
                                    &nbsp;
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Chọn
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_Check" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center" colspan="4">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="grv_chitiethangcon" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="TENSP" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                     BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" 
                        onpageindexchanging="grv_chitiethangcon_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" />
                            <asp:BoundField DataField="SOLUONGCON" HeaderText="Số lượng còn" />
                           
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        </table>
</asp:Content>



