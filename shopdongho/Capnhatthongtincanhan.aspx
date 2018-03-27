<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Capnhatthongtincanhan.aspx.cs" Inherits="Capnhatthongtincanhan" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="text-align: right">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
    </div>
    <table style="border: thin inset #0000FF; width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" 
                style="text-align: center; color: black; background-color: white">
                CẬP NHẬT THÔNG TIN CÁ NHÂN</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                <asp:Label ID="Label1" runat="server" Text="Họ tên:"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txt_hoten" runat="server" 
                    ontextchanged="txt_hoten_TextChanged"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                <asp:Label ID="Label2" runat="server" Text="Địa chỉ:"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txt_diachi" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                <asp:Label ID="Label3" runat="server" Text="Số điện thoại:"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txt_sdt" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bt_capnhat" runat="server" CssClass="style13" 
                    onclick="bt_capnhat_Click" Text="Cập nhật" Width="76px" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style11
        {
            width: 136px;
        }
        .style12
        {
            width: 161px;
        }
        .style13
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #FF99FF;
        }
        .style14
        {
            color: #0000FF;
            background-color: #FFFFFF;
        }
        .style17
        {
        width: 90px;
    }
        .style18
        {
            width: 154px;
            text-align: center;
        }
    </style>
</asp:Content>



