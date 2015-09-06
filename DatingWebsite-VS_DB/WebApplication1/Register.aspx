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
    <div id="attributeForm" runat="server">
        <asp:Label ID="lblAgeRange" runat="server" Text="Age Range: "></asp:Label><br />
        <asp:DropDownList ID="ddlAgeRange" runat="server" OnSelectedIndexChanged="ddlAgeRange_SelectedIndexChanged">
            <asp:ListItem>Select Age Range</asp:ListItem>
        </asp:DropDownList><br />
        <br />
        <asp:Label ID="lblBuild" runat="server" Text="Build: "></asp:Label><br />
        <asp:DropDownList ID="ddlBuild" runat="server"></asp:DropDownList><br />
        <br />
        <asp:Label ID="lblEyeColor" runat="server" Text="Eye Color: "></asp:Label><br />
        <asp:DropDownList ID="ddlEyeColor" runat="server"></asp:DropDownList><br />
        <br />
        <asp:Label ID="lblGender" runat="server" Text="Gender: "></asp:Label><br />
        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList><br />
        <br />
        <asp:Label ID="lblHairColor" runat="server" Text="HairColor: "></asp:Label><br />
        <asp:DropDownList ID="ddlHairColor" runat="server"></asp:DropDownList><br />
        <br />
        <asp:Label ID="lblHeight" runat="server" Text="Height: "></asp:Label><br />
        <asp:DropDownList ID="ddlHeight" runat="server"></asp:DropDownList><br />
        <br />
        <asp:Label ID="lblSexualOrientation" runat="server" Text="Sexual Orientation: "></asp:Label><br />
        <asp:DropDownList ID="ddlSexualOrientation" runat="server"></asp:DropDownList><br />
        <br />
        
        <asp:Label ID="lblHobbies" runat="server" Text="Hobbies: "></asp:Label><br />
        <asp:CheckBoxList ID="cblHobbies" runat="server"></asp:CheckBoxList><br />
        <br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
