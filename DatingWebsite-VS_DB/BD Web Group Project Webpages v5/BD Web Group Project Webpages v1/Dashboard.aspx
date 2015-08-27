<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.Dashboard" %>
<asp:Content ID="cphDashBoardMain" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <!-- This page is for the user to input in the rest of their personal details 
        following initial registration. 
        
        I have called it 'Dashboard' as an overarching suggestion for other
        features or page/add structuring which could be incorporated here later. 
        
        For example, this page could be an initial registration page different from 
        a subequent 'Edit My Details' page, or it could be used for dividing 'Personal Details' 
        out into several divs/pages/sections, or including another page for users to change  
        account details such as email address and password. -->

        <h3>Please enter your details to fill out your profile</h3>
        <br />
        <asp:Label ID="lblLocation" runat="server" Text="Location "></asp:Label>
        <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regxvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"><br />Your location may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="lblProfesssion" runat="server" Text="Profession "></asp:Label>
        <asp:TextBox ID="txtProfession" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regxvProfession" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br />Your profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="lblProfilePic" runat="server" Text="Profile Picture "></asp:Label>
         [To be added later]
        <br />
        <br />
        <asp:Label ID="lblGender" runat="server" Text="Gender "></asp:Label>
        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblOrientation" runat="server" Text="Orientation "></asp:Label>
        <asp:DropDownList ID="ddlOrientation" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblEyeColour" runat="server" Text="Eye colour "></asp:Label>
        <asp:DropDownList ID="ddlEyeColour" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblHairColour" runat="server" Text="Hair Colour "></asp:Label>
        <asp:DropDownList ID="ddlHairColour" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblAge" runat="server" Text="Age "></asp:Label>
        <asp:DropDownList ID="ddlAge" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblHobbies" runat="server" Text="Hobbies "></asp:Label>
        <asp:CheckBoxList ID="cblHobbies" runat="server"></asp:CheckBoxList>
        <br />
        <br />
        <asp:Button ID="btnAddDetails" runat="server" Text="Add Your Details" class="blueButton"/>
</asp:Content>
