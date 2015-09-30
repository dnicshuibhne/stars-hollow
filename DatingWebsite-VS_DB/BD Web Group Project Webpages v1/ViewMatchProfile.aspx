<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMatch.master" AutoEventWireup="true" CodeBehind="ViewMatchProfile.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.ViewMatchProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphViewMatch" runat="server">

    <!-- TODO: update this page with all columns in personal info stored in database. -->

    <h4>View Profile</h4>
    <br />
    <div class="contentWrapper">
        <h1><asp:Label ID="lblUsername" runat="server"></asp:Label></h1>
        <br />
        <asp:Image ID="imgProfilePicture" runat="server" ImageUrl="~/Images/blank-profile-grey.png" CssClass="profilePic"/>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                
                <%--This might be the answer to my problem http://stackoverflow.com/questions/17875489/call-asp-net-function-method-from-div-onclick--%>


                <div id="SendMNewMessageButton" runat="server">
                    <div id="SendNewMessage">
                        Send Me a Message
                    </div>
                </div>
                <%--<asp:Button ID="btnSendNewMessage" runat="server" Text="Send Me a Message" CssClass="blueButton" OnClick="btnSendNewMessage_Click" style="font-size:20px; width:30vw; padding: 20px; margin: auto; display: block; border: 1px solid #824187;"/>--%>
                <div class="detailsWrapper" style="background-color: #A8D1FF">
                    <div id="myMessageInputWrapper">
                        <br />
                        <div id="myMessageTxt">
                            <asp:TextBox ID="txtNewMessage" runat="server" TextMode="MultiLine" Style="resize:none; border: 1px solid #824187;" ForeColor="Black" Height="55px" Width="250px" ToolTip="Say hi"></asp:TextBox>
                        </div>
                        <div id="myMessageSendBtn">
                            <asp:ImageButton ID="imgBtnSendMessage" runat="server" ImageUrl="~/Images/rsz_1008006-glossy-black-icon-arrows-arrowhead2-right.png" OnClick="imgBtnSendMessage_Click" ValidationGroup="NewMessageValGroup" style="background-color: white; border-radius: 2em; margin-left: 5px; border: 1px solid #824187;"/>
                        </div>
                        <br />
                        <asp:RequiredFieldValidator ID="reqvalNewMessage" runat="server" ErrorMessage="You can't enter an empty message" ControlToValidate="txtNewMessage" ValidationGroup="NewMessageValGroup"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <div class="detailsWrapper">
        <fieldset class="detailsBox">
            <legend>About Me</legend>

            
            <h3><asp:Label ID="lblUserDescription" runat="server" ></asp:Label></h3>
            <br />
            <br />
            <br />
            <asp:Label ID="lblCounty" runat="server" Text="County: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserCounty" runat="server" CssClass="userDetails"></asp:Label>
            <%--<asp:Label ID="lblLocation" runat="server" Text="Location: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserLocation" runat="server" Text="Dublin" CssClass="userDetails"></asp:Label>--%>
            <br />
            <br />
            <br />
            <asp:Label ID="lblProfesssion" runat="server" Text="Profession: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserProfesssion" runat="server"  CssClass="userDetails"></asp:Label>
            
        </fieldset>
        
        <fieldset class="detailsBox">
            <legend>Personal Details</legend>
            <asp:Label ID="lblGender" runat="server" Text="Gender: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserGender" runat="server" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblOrientation" runat="server" Text="Orientation: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserOrientation" runat="server" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblEyeColor" runat="server" Text="Eye color: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserEyeColor" runat="server" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            
            <asp:Label ID="lblHairColor" runat="server" Text="Hair Color: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserHairColor" runat="server" CssClass="userDetails"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblAge" runat="server" Text="Age: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserAge" runat="server"  CssClass="userDetails"></asp:Label>
        <%--    <asp:Label ID="lblAgeRange" runat="server" Text="Age Range: " CssClass="profileCategory"></asp:Label>
            <asp:Label ID="lblUserAgeRange" runat="server"  CssClass="userDetails"></asp:Label>--%>
            
        </fieldset>
        <fieldset class="detailsBox">
            <legend>My Hobbies</legend>
            
            <%--<asp:Repeater ID="Repeater1" runat="server">--%>
            <asp:Repeater ID="hobbyRepeater" runat="server">
                <ItemTemplate>
                    <asp:Label ID="lblHobby" runat="server" Text='<%#Eval("HobbyName") %>' CssClass="userDetails"></asp:Label>
                </ItemTemplate>
            </asp:Repeater>

        </fieldset>
        </div>
    </div>
</asp:Content>
