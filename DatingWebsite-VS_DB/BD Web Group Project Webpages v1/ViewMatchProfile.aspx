<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMatch.master" AutoEventWireup="true" CodeBehind="ViewMatchProfile.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.ViewMatchProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphViewMatch" runat="server">

    <h4>View Profile</h4>
    <br />
    <div id="viewMatch">
        <h1><asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label></h1>
        <br />
        <asp:Image ID="imgProfilePicture" runat="server" ImageUrl="~/Images/blank-profile-grey.png"/>
        <br />
        
        <fieldset class="detailsBox profileLeftCol">
            <legend>About Me</legend>

            <asp:Label ID="lblDescription" runat="server" Text="In brief: "></asp:Label>
            <asp:Label ID="lblUSerDescription" runat="server" Text="I am a spaced out guy haha lol ;)"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblLocation" runat="server" Text="Location: "></asp:Label>
            <asp:Label ID="lblUserLocation" runat="server" Text="Dublin"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblProfesssion" runat="server" Text="Profession: "></asp:Label>
            <asp:Label ID="lblUserProfesssion" runat="server" Text="Spaceman"></asp:Label>
            
        </fieldset>
        
        <fieldset class="detailsBox profileLeftCol">
            <legend>Personal Details</legend>
            <asp:Label ID="lblGender" runat="server" Text="Gender: "></asp:Label>
            <asp:Label ID="lblUserGender" runat="server" Text="Male"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblOrientation" runat="server" Text="Orientation: "></asp:Label>
            <asp:Label ID="lblUserOrientation" runat="server" Text="Straight"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblEyeColor" runat="server" Text="Eye color: "></asp:Label>
            <asp:Label ID="lblUserEyeColor" runat="server" Text="Blue"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblHairColor" runat="server" Text="Hair Color: "></asp:Label>
            <asp:Label ID="lblUserHairColor" runat="server" Text="Black"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblAgeRange" runat="server" Text="Age Range: "></asp:Label>
            <asp:Label ID="lblUserAgeRange" runat="server" Text="25-50"></asp:Label>
            
        </fieldset>
        <fieldset class="detailsBox profileLeftCol">
            <legend>My Hobbies</legend>
            
            <!-- What's the best way to list hobbies? -->

        </fieldset>
        
    </div>
</asp:Content>
