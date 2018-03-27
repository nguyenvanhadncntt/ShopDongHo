<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quanlyquangcao.aspx.cs" Inherits="Admin_Quanlyquangcao" MasterPageFile="MasterPage.master" %>

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
                QUẢN LÝ QUẢNG CÁO</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
<asp:GridView ID="grv_quangcao" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MAQUANGCAO" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="MAQUANGCAO" HeaderText="Mã quảng cáo" />
            <asp:BoundField DataField="TENCONGTY" HeaderText="Tên công ty" />
            <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
            <asp:BoundField DataField="ANHQUANGCAO" HeaderText="Ảnh quảng cáo" />           
            <asp:TemplateField>              
                <FooterTemplate>
                    &nbsp;<asp:Button ID="bt_sua" runat="server" onclick="bt_sua_Click" 
                        style="color: #0000FF; background-color: #FF99FF; height: 26px;" 
                        Text="Sửa" />
&nbsp;
                    <asp:Button ID="btDelete" runat="server" Text="Xóa" onclick="btDelete_Click" 
                        style="color: #0000FF; background-color: #FF99FF"/>
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
            </td>
        </tr>
        <tr>
            <td class="style27" style="color: #0000FF">
                <asp:Label ID="Label1" runat="server" Text="Tên công ty:"></asp:Label>
            </td>
            <td style="color: #0000FF">
                <asp:TextBox ID="txt_tencongty" runat="server" Width="148px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Label ID="Label2" runat="server" CssClass="style23" Text="Địa chỉ:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_diachi" runat="server" Width="148px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Label ID="Label3" runat="server" CssClass="style23" Text="Số điện thoại:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_sdt" runat="server" Width="148px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Label ID="Label4" runat="server" CssClass="style23" Text="Email:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_email" runat="server" Width="148px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Label ID="Label5" runat="server" CssClass="style23" Text="Ảnh quảng cáo:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="ful_anhquangcao" runat="server" Width="219px" />
            </td>
        </tr>
        <tr>
            <td class="style24" colspan="2">
                <asp:Button ID="bt_capnhat" runat="server" CssClass="style26" 
                    onclick="bt_capnhat_Click" Text="Cập nhật" Visible="False" />
                <asp:Button ID="bt_them" runat="server" CssClass="style26" 
                    onclick="bt_them_Click" Text="Thêm" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style23
        {
            color: #0000FF;
        }
        .style24
        {
            text-align: center;
        }
        .style26
        {
            color: #0000FF;
            background-color: white;
        }
        .style27
        {
            text-align: right;
            width: 277px;
        }
    </style>
</asp:Content>



