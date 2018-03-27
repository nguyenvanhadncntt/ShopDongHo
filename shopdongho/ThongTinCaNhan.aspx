<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="ThongTinCaNhan.aspx.cs" Inherits="ShopDongHo.ThongTinCaNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style22 {
            width: 100%;
        }
        .auto-style23 {
            height: 83px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style22" style="background-color: #99CCFF" >
        <tr>
            <td class="auto-style23" align="center">
                <asp:Image ID="avatar" runat="server" Height="276px" Width="215px" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Tên:<asp:Label ID="lb_ten" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Địa chỉ email:<asp:Label ID="lb_email" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Giới tính:
                <asp:Label ID="lb_gt" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Địa chỉ:&nbsp;<asp:Label ID="lb_dc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-family: 'Times New Roman', Times, serif; font-weight: bold;" align="center">Số điện thoại:<asp:Label ID="lb_sdt" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Số lượng sản phẩm đã mua:<asp:Label ID="lb_slspdm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif; font-weight: bold">Số tiền đã mua hàng:<asp:Label ID="lb_sotien" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btn_infor" runat="server" OnClick="btn_infor_Click" Text="Cập nhật Thông tin cá nhân" Width="189px" />
            </td>
        </tr>
    </table>
</asp:Content>
