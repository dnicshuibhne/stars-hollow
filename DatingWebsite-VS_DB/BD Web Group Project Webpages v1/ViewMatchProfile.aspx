<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMatch.master" AutoEventWireup="true" CodeBehind="ViewMatchProfile.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.ViewMatchProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphViewMatch" runat="server">

    <h4>View Profile</h4>
    <br />
    <div class="contentWrapper">
        <h1><asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label></h1>
        <br />
        <asp:Image ID="imgProfilePicture" runat="server" ImageUrl="~/Images/blank-profile-grey.png" CssClass="profilePic"/>
        <br />
        
        <div class="detailsWrapper">
        <fieldset class="detailsBox">
            <legend>About Me</legend>

            
            <h3><asp:Label ID="lblUSerDescription" runat="server" Text="I am a spaced out guy haha lol ;)"></asp:Label></h3>
            <br />
            <br />
            <br />
            <asp:Label ID="lblLocation" runat="server" Text="Location: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserLocation" runat="server" Text="Dublin" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblProfesssion" runat="server" Text="Profession: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserProfesssion" runat="server" Text="Spaceman" CssClass="userDetails"></asp:Label>
            
        </fieldset>
        
        <fieldset class="detailsBox">
            <legend>Personal Details</legend>
            <asp:Label ID="lblGender" runat="server" Text="Gender: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserGender" runat="server" Text="Male" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblOrientation" runat="server" Text="Orientation: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserOrientation" runat="server" Text="Straight" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblEyeColor" runat="server" Text="Eye color: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserEyeColor" runat="server" Text="Blue" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblHairColor" runat="server" Text="Hair Color: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserHairColor" runat="server" Text="Black" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblAgeRange" runat="server" Text="Age Range: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserAgeRange" runat="server" Text="25-50" CssClass="userDetails"></asp:Label>
            
        </fieldset>
        <fieldset class="detailsBox">
            <legend>My Hobbies</legend>
            
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <asp:Label ID="lblHobby" runat="server" Text='<%#Eval("HobbyName") %>' CssClass="userDetails"></asp:Label>
                </ItemTemplate>
            </asp:Repeater>

        </fieldset>
        </div>
    </div>
</asp:Content>
