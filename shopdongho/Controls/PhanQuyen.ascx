<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhanQuyen.ascx.cs" Inherits="ShopDongHo.Controls.PhanQuyen" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        margin-left: 0px;
    }
    .auto-style3 {
        height: 25px;
    }
    .auto-style4 {
        height: 24px;
    }
</style>
<asp:MultiView ID="MultiViewAcount" runat="server">
    <asp:View ID="ViewNoAccount" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" align="center" style="background-color: #999999"><strong>ĐĂNG NHẬP</strong></td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #66CCFF; color: #0000FF;">Email:</td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #66CCFF" align="center">
                    <asp:TextBox ID="tb_tk" runat="server" CssClass="auto-style2" Width="155px" Height="15px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF; color: #0033CC;" colspan="2">Mật khẩu:</td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF" colspan="2" align="center">
                    <asp:TextBox ID="tb_mk" runat="server" Width="155px" Height="15px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF" align="right">
                    <asp:Button ID="btn_dn" runat="server" CssClass="auto-style2" Text="Đăng nhập" Width="136px" OnClick="btn_dn_Click" />
                    &nbsp;</td>
                <td style="background-color: #66CCFF"><asp:Button ID="btn_dk" runat="server" Text="Đăng kí" Width="132px" OnClick="btn_dk_Click" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF" class="auto-style3" colspan="2" align="center">
                    <asp:CheckBox ID="remember" runat="server" Text="Lưu đăng nhập" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF" colspan="2" align="center" class="auto-style4">
                    <asp:Label ID="lb_tb" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #66CCFF" align="center">
                    <asp:HyperLink ID="hpk_qmk" runat="server" NavigateUrl="~/QuenMatkhau">Quên mật khẩu</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="ViewUser" runat="server">
        <table class="auto-style1">
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <asp:Image ID="avarta" runat="server" Height="107px" Width="111px" />
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">Họ tên:<asp:Label ID="lb_ht" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF" class="auto-style4">
                    <img alt="" src="../images/icon/application-form.png" />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/ThongTinCaNhan.aspx">Thông tin cá nhân</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <img alt="" src="../images/icon/history-brush.png" />
                    <asp:HyperLink ID="hpk_ls" runat="server" NavigateUrl="~/LichSuMuaHang.aspx">Lịch sử mua hàng</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <img alt="" src="../images/icon/shift-change%20(1).png" />
                    <asp:HyperLink ID="hpk_dmk" runat="server" NavigateUrl="~/DoiMatKhau.aspx">Đổi mật khẩu</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="background-color: #66CCFF" align="center">
                    <img alt="" src="../images/icon/exit.png" />
                    <asp:HyperLink ID="hpk_thoat" runat="server" NavigateUrl="~/DangXuat.aspx">Đăng xuất</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="ViewAdmin" runat="server">
        <table class="auto-style1">
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <asp:Image ID="avarta0" runat="server" Height="107px" Width="111px" />
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">Họ tên:<asp:Label ID="lb_ht0" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style4" style="background-color: #66CCFF">
                    <img alt="" src="../images/icon/application-form.png" />
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ThongTinCaNhan.aspx">Thông tin cá nhân</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon/manager (1).png" />
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/QuanLyAdmin.aspx">Đến trang quản lý</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <img alt="" src="../images/icon/shift-change%20(1).png" />
                    <asp:HyperLink ID="hpk_dmk0" runat="server" NavigateUrl="~/DoiMatKhau.aspx">Đổi mật khẩu</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #66CCFF">
                    <img alt="" src="../images/icon/exit.png" />
                    <asp:HyperLink ID="hpk_thoat0" runat="server" NavigateUrl="~/DangXuat.aspx">Đăng xuất</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>

