<%@ Page Title="" Language="C#" MasterPageFile="~/StarsHollow.master" AutoEventWireup="true" CodeBehind="SearchFor.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.SearchFor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphStarsHollowHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphStarsHollowBody" runat="server">

    <div class="searchForWrapper">
        <h2 id="pageHeader">Search For...</h2>
        <br />
        <section>
            <fieldset class="detailsBox">
                <legend>Search by lifestyle</legend>
                <asp:Label ID="lblLocation" runat="server" Text="Location "></asp:Label>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"><br /> Location may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblProfesssion" runat="server" Text="Profession "></asp:Label>
                <asp:TextBox ID="txtProfession" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvProfession" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br /> Profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
            </fieldset>
            <fieldset class="detailsBox">
                <legend>Search by personal details</legend>
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
            </fieldset>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search Now" class="blueButton dashboardButton"/>
            <br />
            <br />
        </section>
    </div>
</asp:Content>
