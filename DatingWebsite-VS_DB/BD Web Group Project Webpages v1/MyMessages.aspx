<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.MyMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <h4>My Messages</h4>
    <br />
    <div class="detailsBox myMessagesWrapper">
        
        <!-- A list of the user's messages reside in here, inside conversation div's. 
            Each conversation is taken from the database and rendered here in C# using the HtmlTextWriter class.
            For an explanation of how it works, view this link: http://www.dotnetperls.com/htmltextwriter

            As HtmlTextWriter does not function with semantic tags, we will be relying on div and header tags
            to describe the layout of each conversation box.

            Below is a template of a sample message.

             -->
        
        <div class="conversationWrapper">
            <a href ="#">
                <div class="conversationBox linkingDiv">
                    <div class="theirImage">
                        <img src="Images/blank-profile-grey.png" alt="User's profile picture"/>
                    </div>
                    <div class="theirName">
                        Stars Hollow
                    </div>
                    <div class="lastMessage">
                        Hi, welcome to our site!
                    </div>
                </div>
            </a>
        </div>
        
    </div>
</asp:Content>
