<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qlnguoidung.aspx.cs" Inherits="qlnguoidung" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div style="text-align: right">
                <asp:Label ID="lbl_xinchao" runat="server" 
            style="color: #FF0000; text-align: left;"></asp:Label>
    </div>
    <table style="border: thin inset #0000FF; width: 100%; background-color: #93dafd;">
        <tr>
            <td colspan="4" 
                
                style="text-align: center; color: #0000FF; background-color: #93dafd; font-weight: 700;">
                QUẢN LÝ THÔNG TIN CÁ NHÂN</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                </td>
            <td colspan="2" 
                
                style="border: thin none #33CC33; color: #0000FF; background-color: #93dafd;" 
                class="style21">
                <span><em><span class="style19">Bạn muốn thay đổi mật khẩu? Hãy nhấn vào</span>
                </em>&nbsp;</span><asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/Doimatkhau.aspx">Đây</asp:HyperLink>
            </td>
            <td class="style22">
                </td>
        </tr>
        <tr>
            <td class="style23">
                </td>
            <td colspan="2" 
                style="border: thin none #33CC33; color: #0000FF; " class="style24">
                <span><span class="style19"><em>Bạn muốn thay đổi thông tin cá nhân? Nhấn vào</em></span>&nbsp;
                </span>
                <asp:HyperLink ID="HyperLink4" runat="server" 
                    NavigateUrl="~/Capnhatthongtincanhan.aspx">Đây</asp:HyperLink>
            </td>
            <td class="style25">
                </td>
        </tr>
        <tr>
            <td class="style26">
                </td>
            <td colspan="2" 
                style="border: thin none #33CC33; color: #0000FF; " class="style27">
                <span><span class="style19"><em>Tiếp tục quá trình đặt hàng của bạn</em></span>&nbsp;
                </span>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Thanhtoan.aspx">Click vào đây</asp:HyperLink>
            </td>
            <td class="style28">
                </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
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
        .style17
        {
            text-align: left;
        }
        .style18
        {
            width: 97px;
        }
        .style19
        {
            color: #000000;
        }
        .style20
        {
            width: 97px;
            height: 29px;
        }
        .style21
        {
            text-align: left;
            height: 29px;
        }
        .style22
        {
            height: 29px;
        }
        .style23
        {
            width: 97px;
            height: 20px;
        }
        .style24
        {
            text-align: left;
            height: 20px;
        }
        .style25
        {
            height: 20px;
        }
        .style26
        {
            width: 97px;
            height: 11px;
        }
        .style27
        {
            text-align: left;
            height: 11px;
        }
        .style28
        {
            height: 11px;
        }
    </style>
</asp:Content>




