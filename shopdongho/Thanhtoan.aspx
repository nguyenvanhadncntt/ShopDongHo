<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thanhtoan.aspx.cs" Inherits="Thanhtoan" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width:100%; background-color: #93dafd;">
        <tr>
            <td colspan="2" 
                style="color: #FFFFFF; text-align: right; background-color: #FFFFFF">
                <asp:Label ID="lbl_xinchao" runat="server" 
                    style="color: #FF0000; text-align: right;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" 
                
                style="color: #0000FF; text-align: center; background-color: #99CCFF; font-weight: 700;">
                THANH TOÁN</td>
        </tr>
        <tr>
            <td colspan="2" style="color: #3333FF">
                Qúy khách vui lòng chọn phương thức thanh toán phù hợp với mình!</td>
        </tr>
        <tr>
            <td bgcolor="#6699FF" 
                
                style="border: thin groove #0000FF; text-align: center; " class="style21">
                Phương thức thanh toán</td>
            <td bgcolor="#6699FF" 
                style="border: thin groove #0000FF; text-align: center; " class="style20">
                Chi tiết</td>
        </tr>
        <tr class="style9">
            <td class="style22" style="border: thin groove #0000FF; text-align: left;">
                <asp:RadioButton ID="rbtienmat" runat="server" Text="Tiền mặt" 
                    AutoPostBack="True" />
            </td>
            <td style="border: thin groove #0000FF; text-align: justify;" class="style18">
                Quý khách có thể thanh toán tiền cho nhân viên giao hàng của chúng tôi hoặc tới 
                trực tiếp chỗ chúng tôi để thanh toán</td>
        </tr>
        <tr class="style9">
            <td class="style22" style="border: thin groove #0000FF">
                <asp:RadioButton ID="rbquabuudien" runat="server" Text="Qua bưu điện" 
                    AutoPostBack="True" />
            </td>
            <td style="border: thin groove #0000FF; text-align: justify;" class="style18">
                Shop Baby, 108 Nguyễn Sinh Cung,tp.Huế</td>
        </tr>
        <tr class="style9">
            <td class="style22" style="border: thin groove #0000FF">
                <asp:RadioButton ID="rbchuyenkhoan" runat="server" Text="Chuyển khoản" 
                    AutoPostBack="True" />
            </td>
            <td style="border: thin groove #0000FF; text-align: justify;" class="style18">
                Ngân hàng đầu tư và phát triển Việt Nam chi nhánh ThừaThiên Huế<br />
                Chủ tài khoản: Nguyễn Thị Hương<br />
                Số tài khoản: 6688 9900 1639 1540</td>
        </tr>
        <tr class="style9">
            <td class="style22" style="border: thin groove #0000FF">
                <asp:RadioButton ID="rbnganluong" runat="server" Text="Ngân lượng.vn" 
                    AutoPostBack="True" />
            </td>
            <td style="border: thin groove #0000FF" class="style19">
                Tìm hiểu thêm thông tin tại <a href="http://nganluong.vn" target="_blank">đây</a> </td>
            </td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: large">
                Hãy chọn phương thức vận chuyển mong muốn!</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" 
                    style="text-align: center; color: #3333FF" Text="Phương thức vận chuyển:"></asp:Label>
&nbsp;&nbsp;
                <asp:DropDownList ID="drp_ptvc" runat="server" Height="18px" Width="150px">
                    <asp:ListItem>Qua bưu điện</asp:ListItem>
                    <asp:ListItem>Tận nhà</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="bt_tieptuc" runat="server" CssClass="style12" 
                    onclick="bt_tieptuc_Click" Text="Tiếp tục" Width="69px" />
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
        .style11
        {
            text-align: left;
        }
        .style12
        {
            color: #0000FF;
            font-weight: bold;
            background-color: white;
        }
        .style13
        {
            color: blue;
        }
        .style14
        {
            height: 30px;
        }
        .style18
        {
            background-color: #99CCFF;
        }
        .style19
        {
            text-align: justify;
            background-color: #99CCFF;
        }
        .style20
        {
            color: #FFFFFF;
            background-color: #0000FF;
        }
        .style21
        {
            color: #FFFFFF;
            background-color: #0000FF;
            width: 119px;
        }
        .style22
        {
            background-color: #99CCFF;
            width: 119px;
        }
        .style23
        {
            width: 119px;
        }
    </style>
</asp:Content>




