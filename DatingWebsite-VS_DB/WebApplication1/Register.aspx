<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div runat="server">
        <asp:Label ID="lblAgeRange" runat="server" Text="Age Range: "></asp:Label><br />
        <asp:DropDownList ID="ddlAgeRange" runat="server"></asp:DropDownList><br />
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
        <asp:Label ID="lblHobbies" runat="server" Text="Hobbies: "></asp:Label><br />
        <asp:RadioButtonList ID="rblHobbies" runat="server"></asp:RadioButtonList><br />
        <br />
        <asp:Label ID="lblSexualOrientation" runat="server" Text="Sexual Orientation: "></asp:Label><br />
        <asp:DropDownList ID="ddlSexualOrientation" runat="server"></asp:DropDownList><br />
        <br />
    </div>
    </form>
</body>
</html>
