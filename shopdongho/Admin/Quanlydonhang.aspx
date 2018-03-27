<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quanlydonhang.aspx.cs" Inherits="Admin_Quanlydonhang" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="2" style="text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" 
                
                
                style="text-align: center; font-weight: 700; color: black; background-color: white">
                QUẢN LÝ ĐƠN HÀNG</td>
        </tr>
        <tr>
            <td colspan="2" 
                
                
                
                style="text-align: center; font-weight: 700; color: #0000FF; background-color: #93dafd" 
                class="style26">
                &nbsp;<asp:Button ID="bt_tatca" runat="server" onclick="bt_tatca_Click" 
                    style="color: #0000FF; background-color: white" Text="Tất cả" />
&nbsp;
                <asp:Label ID="Label12" runat="server" Text="Nhập tên khách:"></asp:Label>
&nbsp;
                <asp:TextBox ID="txt_tenkhach1" runat="server" Width="166px"></asp:TextBox>
&nbsp;
                <asp:Label ID="Label13" runat="server" Text="chọn tháng:"></asp:Label>
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
                <asp:Button ID="bt_tim" runat="server" onclick="bt_tim_Click" 
                    style="color: #0000FF; margin-left: 17px; background-color: white" 
                    Text="Tìm" />
            </td>
        </tr>
        <tr>
            <td colspan="2" 
                
                
                
                style="text-align: center; font-weight: 700; color: #0000FF; background-color: #FFCCFF">
                &nbsp;
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="grv_donhang" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MADH" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MADH" HeaderText="Mã đơng hàng" />
                            <asp:BoundField DataField="HOTEN" HeaderText="Tên khách" />
                            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                            <asp:BoundField DataField="NGAYDATHANG" HeaderText="Ngày đặt hàng" />
                            <asp:BoundField DataField="CHUKY" HeaderText="chữ ký" />
                            <asp:BoundField DataField="TONGTIEN" HeaderText="tổng tiền" />
                            <asp:BoundField DataField="PTTT" HeaderText="PTTT" />
                            <asp:BoundField DataField="PTVC" HeaderText="PTVC" />
                            <asp:BoundField DataField="TINHTRANG" HeaderText="Tình trạng" />
                            <asp:BoundField DataField="GHICHU" HeaderText="Ghi chú" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;<asp:Button ID="bt_chitiet" runat="server" onclick="bt_sua_Click" 
                        style="color: #0000FF; background-color: white" Text="Chi tiết" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="bt_sua" runat="server" Text="Sửa" onclick="bt_sua_Click1" 
                        style="color: #0000FF; background-color: white"/>
                                    &nbsp;<asp:Button ID="btDelete" runat="server" onclick="btDelete_Click" 
                        style="color: #0000FF; background-color: white" Text="Xóa" />
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
            <td colspan="2" style="text-align: center">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:GridView ID="grv_timkiem" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MADH" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
 BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center" onpageindexchanging="grv_timkiem_PageIndexChanging">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MADH" HeaderText="Mã đơng hàng" />
                            <asp:BoundField DataField="HOTEN" HeaderText="Tên khách" />
                            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                            <asp:BoundField DataField="NGAYDATHANG" HeaderText="Ngày đặt hàng" />
                            <asp:BoundField DataField="CHUKY" HeaderText="chữ ký" />
                            <asp:BoundField DataField="TONGTIEN" HeaderText="tổng tiền" />
                            <asp:BoundField DataField="PTTT" HeaderText="PTTT" />
                            <asp:BoundField DataField="PTVC" HeaderText="PTVC" />
                            <asp:BoundField DataField="TINHTRANG" HeaderText="Tình trạng" />
                            <asp:BoundField DataField="GHICHU" HeaderText="Ghi chú" />
                            <asp:TemplateField>
                                <FooterTemplate>
                                    &nbsp;<asp:Button ID="bt_ct1" runat="server" 
                        style="color: #0000FF; background-color: white; height: 26px;" Text="Chi tiết" 
                                        onclick="bt_ct1_Click" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="bt_s1" runat="server" Text="Sửa" 
                        style="color: #0000FF; background-color: white" onclick="bt_s1_Click"/>
                                    &nbsp;<asp:Button ID="btx1" runat="server" 
                        style="color: #0000FF; background-color: white" Text="Xóa" onclick="btx1_Click" />
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Chọn
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk_Check0" runat="server" />
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
            <td colspan="2" style="text-align: right">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label1" runat="server" CssClass="style22" Text="Tên khách:"></asp:Label>
            </td>
            <td class="style24">
                <asp:TextBox ID="txt_tenkhach" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label2" runat="server" CssClass="style22" Text="Địa chỉ:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_diachi" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label3" runat="server" CssClass="style22" Text="SĐT:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_sdt" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label4" runat="server" CssClass="style22" Text="Email:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_email" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label5" runat="server" CssClass="style22" Text="Ngày đặt hàng:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_ngaydathang" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label6" runat="server" CssClass="style22" Text="Chữ ký:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_chuky" runat="server" Width="170px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label7" runat="server" CssClass="style22" Text="Tổng tiền:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_tongtien" runat="server" Enabled="False" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label9" runat="server" CssClass="style22" 
                    Text="Phương thức thanh toán:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_pttt" runat="server" Enabled="False" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label8" runat="server" CssClass="style22" 
                    Text="Phương thức vận chuyển:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_ptvc" runat="server" Enabled="False" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label10" runat="server" CssClass="style22" Text="Tình trạng:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drp_tinhtrang" runat="server" Width="170px">
                    <asp:ListItem Value="Chưa xử lý"></asp:ListItem>
                    <asp:ListItem>Đã xử lý</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="Label11" runat="server" CssClass="style22" Text="Ghi chú:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drp_ghichu" runat="server" Width="170px">
                    <asp:ListItem>Chưa thanh toán</asp:ListItem>
                    <asp:ListItem>Đã thanh toán</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="bt_capnhat" runat="server" Enabled="False" 
                    onclick="bt_capnhat_Click" style="color: #0000FF; background-color: white" 
                    Text="Cập nhật" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style20
        {
            text-align: left;
        }
        .style22
        {
            color: #0000FF;
        }
        .style24
        {
            text-align: left;
            height: 26px;
        }
        .style25
        {
            text-align: right;
        }
        .style26
        {
            height: 34px;
        }
    </style>
</asp:Content>




