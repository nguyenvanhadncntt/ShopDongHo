<%@ Page Language="C#" AutoEventWireup="true" CodeFile="thongbaohoantatdathang.aspx.cs" Inherits="thongbaohoantatdathang" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%; background-color: #93dafd;">
        <tr>
            <td style="text-align: right; background-color: #93dafd">
                <asp:Label ID="lbl_xinchao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-style: italic">
        <p style="text-align: justify">
            <span class="style10" lang="VI" 
                style="font-size: 14.0pt; line-height: 115%; font-family: &quot;12px Arial&quot;,&quot;serif&quot;;">
            Quý khách đã đặt hàng thành công. Đơn hàng đã được gửi đến email của quí khách. 
            Chúng tôi sẽ&nbsp; chuyển 
            hàng đến cho quý khách trong thời gian sớm nhất.<br />
            Xin chân thành cảm ơn quý khách đã đến với Shop Baby!</span></p>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">

        .style10
        {
            color: blue;
        }
    </style>
</asp:Content>



