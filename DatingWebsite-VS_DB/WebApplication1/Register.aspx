<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div id="regForm">
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassword1" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassword2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
        <br /><br /><br />
    </form>
</body>
</html>
