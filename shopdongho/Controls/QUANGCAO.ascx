<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QUANGCAO.ascx.cs" Inherits="ShopDongHo.Controls.QUANGCAO" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" Width="100%">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# Eval("ANHQUANGCAO") %>' ImageWidth="100%">HyperLink</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>

