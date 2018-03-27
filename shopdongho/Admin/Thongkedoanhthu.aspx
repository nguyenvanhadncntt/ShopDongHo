<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thongkedoanhthu.aspx.cs" Inherits="Admin_Thongkedoanhthu" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td 
                
                style="text-align: center; color:black; font-weight: 700; background-color: white">
                THỐNG KÊ DOANH THU</td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;<asp:Button ID="bt_tatca" runat="server" onclick="bt_tatca_Click1" 
                    style="background-color: white" Text="Tất cả" />
&nbsp;
                <asp:Label ID="Label1" runat="server" CssClass="style21" Text="Chọn tháng:"></asp:Label>
                <asp:DropDownList ID="drp_thang" runat="server">
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
                <asp:Button ID="bt_doanhthu" runat="server" CssClass="style21" 
                    Text="Doanh thu" onclick="bt_doanhthu_Click" />
                <asp:DropDownList ID="drp_a" runat="server" Height="16px" Width="89px" 
                    Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style22" style="text-align: center; color: #0000FF">
                <asp:Label ID="lbl_1" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lbl_2" runat="server" style="color: #FF0000"></asp:Label>
&nbsp;&nbsp;<asp:Label ID="lbl_5" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lbl_3" runat="server" style="color: #FF0000"></asp:Label>
                <asp:Label ID="lbl_4" runat="server" style="color: #0000FF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Panel ID="Panel1" runat="server" style="text-align: center">
                    <asp:GridView ID="grv_chitietdh" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MACHITIETDH" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" Width="645px">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MACHITIETDH" HeaderText="Mã chi tiết đơn hàng" />
                            <asp:BoundField DataField="MADH" HeaderText="Mã đơn hàng" />
                            <asp:BoundField DataField="TENSP" HeaderText="Tên SP" />
                            <asp:BoundField DataField="GIA" HeaderText="Giá" />
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
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
                <asp:Panel ID="Panel2" runat="server" style="text-align: center" 
                    Visible="False">
                    <asp:GridView ID="grv_ctdh" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MACHITIETDH" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" onpageindexchanging="grv_ctdh_PageIndexChanging" 
                        Width="644px">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MACHITIETDH" HeaderText="Mã chi tiết đơn hàng" />
                            <asp:BoundField DataField="MADH" HeaderText="Mã đơn hàng" />
                            <asp:BoundField DataField="TENSP" HeaderText="Tên SP" />
                            <asp:BoundField DataField="GIA" HeaderText="Giá" />
                            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                            <asp:BoundField DataField="THANHTIEN" HeaderText="Thành tiền" />
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



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style21
        {
            color: #0000FF;
            font-weight: 700;
        }
        .style22
        {
            height: 23px;
        }
    </style>
</asp:Content>




