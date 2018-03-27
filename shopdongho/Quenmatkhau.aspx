<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quenmatkhau.aspx.cs" Inherits="Quenmatkhau" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width:100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" 
                
                style="text-align: center; color: #0000FF; background-color: #93dafd; font-weight: 700;">
                QUÊN MẬT KHẨU</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_tendangnhap" runat="server" Width="167px" 
                    style="margin-left: 0px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
            </td>
            <td class="style20">
                <asp:TextBox ID="txt_email" runat="server" Width="167px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    style="font-weight: 700; color: #0000FF; background-color: white;" 
                    Text="Gửi đi" Width="69px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbl_thongbao" runat="server" style="color: #FF0000"></asp:Label>
            &nbsp;
                </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style19">
                <asp:Label ID="lbl_matkhau" runat="server" style="color: #FF0000"></asp:Label>
            </td>
            <td class="style20">
                <asp:DropDownList ID="drp_matkhau" runat="server" Height="17px" Visible="False" 
                    Width="152px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td colspan="2" style="text-align: center">
                <asp:HyperLink ID="hp1" runat="server" NavigateUrl="~/Dangnhap.aspx" 
                    Visible="False">[Click vào đây để đăng nhập]</asp:HyperLink>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style13
        {
            height: 24px;
            width: 139px;
        }
        .style14
        {
            width: 139px;
        }
        .style15
        {
            height: 24px;
            width: 135px;
        }
        .style18
        {
            width: 116px;
        }
        .style19
        {
            width: 135px;
            text-align: right;
        }
        .style20
        {
            width: 9px;
        }
    </style>
</asp:Content>



