<%@ Page Title="" Language="C#" MasterPageFile="~/Master_all.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="ShopDongHo.Giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:DataGrid ID="dgcart" runat="server" AutoGenerateColumns="False" 
        Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" 
        BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
        ondeletecommand="dgcart_DeleteCommand" oneditcommand="dgcart_EditCommand" 
        onupdatecommand="dgcart_UpdateCommand">
        <AlternatingItemStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:ButtonColumn CommandName="Delete" Text="Xóa">
                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" ForeColor="#0066FF" />
            </asp:ButtonColumn>
            <asp:TemplateColumn HeaderText="TT">
               <ItemTemplate> <%= i++ %></ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn DataField="TENSP" HeaderText="Tên sản phẩm" ReadOnly="True">
            </asp:BoundColumn>
            <asp:TemplateColumn HeaderText="Hình ảnh">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="80px" Width="80px" ImageUrl='<%# Eval("ANHSP") %>'/>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn DataField="SOLUONGSP" HeaderText="Số lượng"></asp:BoundColumn>
            <asp:BoundColumn DataField="DONGIA" HeaderText="Đơn giá" ReadOnly="True">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="THANHTIEN" HeaderText="Thành tiền" ReadOnly="True">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MASP" HeaderText="Mã sản phẩm" Visible="False">
            </asp:BoundColumn>
            <asp:EditCommandColumn EditText="Sửa!" UpdateText="Cập nhật!">
                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" ForeColor="#3366FF" />
            </asp:EditCommandColumn>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" 
            Mode="NumericPages" />
        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataGrid>    
   <div>
   </div>
    
    <div style="text-align: center">
        <asp:Label ID="Label2" runat="server" Text="Tổng tiền: "></asp:Label>
    &nbsp;
    <asp:Label ID="Label1" runat="server" style="color: #FF0000"></asp:Label>
    &nbsp;<br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Mua tiếp" CssClass="style14" />

    <asp:Button ID="bt_dathang" runat="server" 
        style="font-weight: 700; height: 26px;" 
        Text="Đặt hàng" Width="78px" onclick="bt_dathang_Click" CssClass="style14" />
    </div>
    <br />

</asp:Content>
