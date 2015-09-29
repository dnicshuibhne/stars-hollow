<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.MyMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <h4>My Messages</h4>
    <br />
    
    <%-- This page is composed of two overlapping things:
        1. a div which displays the messages of the conversation selected by the user.
        2. a list of divs for each conversation in the user's history.
            
        Div 1. is invisible until a Div 2 is clicked.
        --%>

    <%--Helper button for filling dummy data into the Conversation table--%>
    <%--<asp:Button ID="btnInsertCommand" runat="server" Text="Insert Data Into Convo table" OnClick="btnInsertCommand_Click" />--%>

    
    <div id="MessageThread"  visible="false" class="contentWrapper" runat="server" >
        <asp:Button ID="closeThisMessage" runat="server" Text="X" CssClass="blueButton" style="padding: 7px 12px; margin: 10px 10px; float:right;" OnClick="closeThisMessage_Click1" CausesValidation="False" />
        <br />
        <br />
        <asp:ScriptManager ID="scrptmngrNewMessage" runat="server" />
        <asp:UpdatePanel ID="updatepanelNewMessage" runat="server" UpdateMode="Conditional">
            <ContentTemplate>        
                <div id="MessageThreadUpperWrapper">
                    <img src="Images/blank-profile-grey.png" class="messageThreadImage"/>
                    <div id="convoMessages">
                        <asp:Repeater ID="rptconvoMessages" runat="server">
                            <ItemTemplate>
                                <div class='<%#getCssClass((int)Eval("SenderID")) %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                                    <asp:Label ID="lblMessage" runat="server" Text='<%#Eval("Content") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div id="myMessageInputWrapper">
                    <div id="myMessageTxt">
                        <asp:TextBox ID="txtNewMessage" runat="server" TextMode="MultiLine" Style="resize:none" ForeColor="Black" Height="50px" Width="250px" ToolTip="Say hi"></asp:TextBox>
                    </div>
                    <div id="myMessageSendBtn">
                        <asp:ImageButton ID="imgBtnSendMessage" runat="server" ImageUrl="~/Images/rsz_1008006-glossy-black-icon-arrows-arrowhead2-right.png" OnClick="imgBtnSendMessage_Click" ValidationGroup="NewMessageValGroup" />
                    </div>
                    <br />
                    <asp:RequiredFieldValidator ID="reqvalNewMessage" runat="server" ErrorMessage="You can't enter an empty message" ControlToValidate="txtNewMessage" ValidationGroup="NewMessageValGroup"></asp:RequiredFieldValidator>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <!-- Using a repeater to load messages from the database and present as conversation summaries -->

    <!--
    This uses Example3.aspx from XMLExamples on Moodle as a guide.
            
    The code behind for the repeater Page_Load should look like this:
             
        string modulesConn = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
        conn = new SqlConnection(modulesConn);
        string query = "SELECT * FROM tblModules";
        SqlCommand cmd = new SqlCommand(query, conn);
        using(conn)
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            rptModules.DataSource = reader;
            rptModules.DataBind();
        } 
    -->
    <div id="mySummaries" visible="true" runat="server">
        <asp:Repeater ID="rptSummaries" runat="server" >
            <ItemTemplate>
                <a href='MyMessages.aspx?<%#Eval("ConversationID") %>'>
                    <div class="conversationBox linkingDiv">
                        <div class="theirImage">
                            <img src="Images/blank-profile-grey.png" alt="User's profile picture"/>
                        </div>
                        <div class="theirName">
                            <%#Eval("OtherPersonName") %>
                        </div>
                        <div class="lastMessage">
                            <%#Eval("LastMessage") %>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
            <!-- 
                Below is a template of a sample message. It was designed with HtmlTextWriter in mind, which we are now not using.

                I'm keeping it here as a temporary guide for the visual layout of each conversation summary.
                -->
            
            <%--<div class="conversationWrapper">
            <a>
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
            </div>--%>
                
    </div>
</asp:Content>