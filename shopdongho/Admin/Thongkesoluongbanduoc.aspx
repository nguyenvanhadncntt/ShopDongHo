<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongkesoluongbanduoc.aspx.cs" Inherits="Admin_Thongkesoluongbanduoc" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: right; background-color: #FFFFFF" colspan="11">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td 
                
                
                style="text-align: center; color: #0000FF; font-weight: 700; background-color: white" 
                colspan="11">
                THỐNG KÊ SỐ LƯỢNG SẢN PHẨM BÁN ĐƯỢC</td>
        </tr>
        <tr>
            <td style="text-align: center; color: #0000FF" colspan="11">
                &nbsp;<asp:Button ID="bt_tatca" runat="server" onclick="bt_tatca_Click" 
                    style="color: #0000FF; background-color: white" Text="Tất cả" />
&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Chọn tháng:"></asp:Label>
&nbsp;<asp:DropDownList ID="drp_thang" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
&nbsp;
                <asp:Button ID="bt_doanhthu" runat="server" 
                    style="color: #0000FF; background-color: white" Text="Số lượng" 
                    onclick="bt_doanhthu_Click" />
&nbsp;<asp:DropDownList ID="drp_a" runat="server" Visible="False">
                </asp:DropDownList>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; color: #0000FF;" colspan="11">
                <asp:Label ID="lbl_1" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lbl_2" runat="server" style="color: #FF0000"></asp:Label>
                <asp:Label ID="lbl_5" runat="server"></asp:Label>
                <asp:Label ID="lbl_3" runat="server" style="color: #FF0000"></asp:Label>
                <asp:Label ID="lbl_4" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="4">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="grv_slban" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="TENSP" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" />
                            <asp:BoundField DataField="SOLUONGBAN" HeaderText="Số lượng bán" />
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
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center" colspan="2">
                &nbsp;</td>
            <td style="text-align: center" colspan="4">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="grv_slbantheothang" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="TENSP" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" 
                        onpageindexchanging="grv_slbantheothang_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" />
                            <asp:BoundField DataField="SOLUONGBAN" HeaderText="Số lượng bán" />
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


