<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quanlynhomhang.aspx.cs" Inherits="Admin_Quanlynhomhang" MasterPageFile="MasterPage.master" EnableEventValidation = "true"%>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" style="text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" 
                style="text-align: center; color: black; font-weight: 700; background-color: white">
                QUẢN LÝ NHÓM HÀNG</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
            <td>
<asp:GridView ID="grv_nhomhang" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MANH" ShowFooter="True" 
        AllowPaging="True" AllowSorting="True"        
        CellPadding="3" GridLines="Vertical" 
                    onpageindexchanging="grv_nhomhang_PageIndexChanging" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    style="text-align: center">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="MANH" HeaderText="Mã nhóm hàng" />
            <asp:BoundField DataField="TENNH" HeaderText="Tên nhóm hàng" />
            <asp:TemplateField>              
                <FooterTemplate>
                    &nbsp;<asp:Button ID="bt_sua" runat="server" onclick="bt_sua_Click" 
                        style="color: #0000FF; background-color: white" Text="Sửa" />
&nbsp;
                    <asp:Button ID="btDelete" runat="server" Text="Xóa" onclick="btDelete_Click" 
                        style="color: #0000FF; background-color: white"/>
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
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; color: #0000FF">
&nbsp;</td>
            <td style="text-align: center; color: #0000FF">
                <asp:Label ID="Label2" runat="server" Text="Chọn loại hàng:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="drp_loaihang" runat="server" Height="19px" Width="148px">
                </asp:DropDownList>
            </td>
            <td style="text-align: left; color: #0000FF">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; color: #0000FF">
&nbsp;&nbsp; 
                &nbsp;</td>
            <td style="text-align: center; color: #0000FF">
                <asp:Label ID="Label1" runat="server" Text="Nhập tên nhóm hàng:"></asp:Label>
&nbsp;<asp:TextBox ID="txt_tennhomhang" runat="server" Width="148px"></asp:TextBox>
            </td>
            <td style="text-align: left; color: #0000FF">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                &nbsp;<asp:Button ID="bt_capnhat" runat="server" onclick="Button1_Click" 
                    style="color: #0000FF; background-color: white" Text="Cập nhật" 
                    Visible="False" />
&nbsp;&nbsp;
                <asp:Button ID="bt_them" runat="server" onclick="bt_them_Click" 
                    style="color: #0000FF; background-color: white" Text="Thêm" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="lbl_thanhcong" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style20">
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
        .style20
        {
            width: 49px;
        }
    </style>
</asp:Content>




