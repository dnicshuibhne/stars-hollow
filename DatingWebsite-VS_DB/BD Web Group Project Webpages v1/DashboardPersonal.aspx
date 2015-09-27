<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="DashboardPersonal.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.DashboardPersonal" %>
<asp:Content ID="cphStarsHollowBody" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <!-- This page is for the user to input in the rest of their personal details 
        following initial registration. -->

        <h4>Edit Personal Details</h4>
        <br />
        <div class="contentWrapper">
            <div class="detailsBoxOutline">
                <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br />Your profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblTown" runat="server" Text="Town"></asp:Label>
                <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvTown" runat="server" ControlToValidate="txtTown" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"><br />Your town may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblCounty" runat="server" Text="County"></asp:Label>
                <asp:DropDownList ID="ddlCounty" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblProfesssion" runat="server" Text="Profession"></asp:Label>
                <asp:TextBox ID="txtProfession" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvProfession" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br />Your profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblOrientation" runat="server" Text="Orientation"></asp:Label>
                <asp:DropDownList ID="ddlOrientation" runat="server"></asp:DropDownList>
                <br />
                <br />
			    <!-- Changed colour to color -->
                <asp:Label ID="lblEyeColor" runat="server" Text="Eye color"></asp:Label>
                <asp:DropDownList ID="ddlEyeColor" runat="server"></asp:DropDownList>
                <br />
                <br />
			    <!-- Changed colour to color -->
                <asp:Label ID="lblHairColor" runat="server" Text="Hair Color"></asp:Label>
                <asp:DropDownList ID="ddlHairColor" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblBuild" runat="server" Text="Build"></asp:Label>
                <asp:DropDownList ID="ddlBuild" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblHeight" runat="server" Text="Height"></asp:Label>
                <asp:DropDownList ID="ddlHeight" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblEthnicity" runat="server" Text="Ethnicity"></asp:Label>
                <asp:DropDownList ID="ddlEthnicity" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblRelationshipStatus" runat="server" Text="Relationship Status"></asp:Label>
                <asp:DropDownList ID="ddlRelationshipStatus" runat="server"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblIdealDate" runat="server" Text="Tell us about your ideal date"></asp:Label>
                <asp:TextBox ID="txtIdealDate" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br />Your profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                <asp:CheckBoxList ID="cblHobbies" runat="server" OnSelectedIndexChanged="cblHobbies_SelectedIndexChanged"></asp:CheckBoxList>
                <br />
                <br />
                <asp:Button ID="btnUpdateDetails" runat="server" Text="Update Personal Details" CssClass="blueButton dashboardButton" OnClick="btnUpdateDetails_Click"/>
                <br />
                <br />
            </div>
        </div>
</asp:Content>
