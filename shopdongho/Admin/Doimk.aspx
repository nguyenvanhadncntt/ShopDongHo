<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Doimk.aspx.cs" Inherits="Admin_Xoamk" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width:100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" style="text-align: right">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" 
                style="text-align: center; " class="style23">
                ĐỔI MẬT KHẨU</td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Mật khẩu cũ:" CssClass="style22"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_mkcu" runat="server" Width="165px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu mới(&gt;= 6 kí tự):" 
                    CssClass="style22"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_mkmoi" runat="server" Width="165px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
              ErrorMessage="Nhập mật khẩu mới" ControlToValidate="txt_mkmoi" ForeColor="Red" 
                    CssClass="style15"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nhập lại mật khẩu mới:" 
                    CssClass="style22"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_ktramkmoi" runat="server" Width="165px" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
              ErrorMessage="Nhập mật khẩu xác nhận" ControlToValidate="txt_ktramkmoi" 
              ForeColor="Red" CssClass="style15"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
              ControlToCompare="txt_mkmoi" ControlToValidate="txt_ktramkmoi" 
              ErrorMessage="Mật khẩu xác nhận không đúng" ForeColor="Red" CssClass="style15"></asp:CompareValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bt_capnhat" runat="server" 
                    style="color: #0000FF; background-color: white" Text="Cập nhật" 
                    onclick="bt_capnhat_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="lbl_thanhcong" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style17
        {
            width: 170px;
        }
        .style18
        {
            text-align: center;
        }
        .style19
        {
            width: 124px;
        }
        .style20
        {
            width: 171px;
        }
        .style21
        {
            width: 101px;
        }
        .style22
        {
            color: #0000FF;
        }
        .style23
        {
            color: black;
            background-color: white;
        }
    </style>
</asp:Content>



