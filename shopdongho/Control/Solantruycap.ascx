<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Solantruycap.ascx.cs" Inherits="Control_Solantruycap" %>
<style type="text/css">
    .style4
    {
        color: #0000FF;
        width: 237px;
        background-color: #93dafd;
    }
</style>

<table style="width:100%; height: 76px; background-color: #93dafd;">
    <tr>
        <td align="center" colspan="2" 
            style="background-color: #FFFFFF; font-family: 'Times New Roman', Times, serif; color: #0000FF; font-weight: 700;" 
            valign="top" bgcolor="Gray">
            ...::&quot;THỐNG KÊ&quot;::...</td>
    </tr>
    <tr style="color: #009900; background-color: #FFFFFF">
        <td class="style4" valign="top" align="left">
            Lần truy cập:</td>
        <td valign="top" width="90px" style="background-color: #93dafd">
            <asp:Label ID="lblantruycap" runat="server" style="color: #0000FF"></asp:Label>
        </td>
    </tr>
    <tr style="color: #009900; background-color: #FFFFFF">
        <td class="style4" valign="top" align="left">
            Online:</td>
        <td valign="top" width="90px" 
            style="color: #0000FF; background-color: #93dafd;">
            <asp:Label ID="lbnguoionline" runat="server"></asp:Label>
        </td>
    </tr>
</table>