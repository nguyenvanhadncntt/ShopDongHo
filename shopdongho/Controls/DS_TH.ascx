<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DS_TH.ascx.cs" Inherits="ShopDongHo.Controls.DS_TH" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 7px;
        height: 23px;
    }
    .auto-style3 {
        height: 23px;
    }
</style>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" Width="100%">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/images/stock-vector-tick-sign-icon-check-mark-symbol-blue-circle-button-with-icon-vector-413880346.jpg" Width="16px" />
                        </td>
                        <td class="auto-style3">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ThuongHieu.aspx?mn="+Eval("MANH") %>' Text='<%# Eval("TENNH") %>'></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


