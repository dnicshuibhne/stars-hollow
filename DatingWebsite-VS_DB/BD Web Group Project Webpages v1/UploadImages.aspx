<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="UploadImages.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDashboardMain" runat="server">
<asp:FileUpload ID="FileUpload" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"/>
<hr />
<asp:GridView ID="grdImages" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:BoundField DataField="Text" />
        <asp:ImageField DataImageUrlField="Value"  />
    </Columns>
</asp:GridView>
    <hr />

</asp:Content>
