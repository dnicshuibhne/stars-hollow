<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.MyMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <h4>My Messages</h4>
    <br />
    
    <%-- This page is composed of two overlapping things:
        1. a div which displays the messages of the conversation selected byt the user.
        2. a list of divs for each conversation in the user's history.
            
        Div 1. is invisible until a Div 2 is clicked.
        --%>
    <div class="contentWrapper">
        <div id="myMessage"  visible="true" class="conversationBox theirImage" runat="server" >
            <asp:Button ID="closeThisMessage" runat="server" Text="X" CssClass="purpleButton" style="margin: 10px 10px; float:right;"/>
            <br />
            <asp:Image ID="imgTheirProfilePic" runat="server" ImageUrl="~/Images/blank-profile-grey.png" style="position: absolute; bottom:0px; margin-left:40px; margin-top: 900px"/>
            <div id="convoMessages" >
                <asp:Repeater ID="rptconvoMessages" runat="server">
                    <ItemTemplate>
                        <div class='<%getCssClass((int)Eval("SenderID"), (int)Eval("ReceiverID")); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                            <asp:Label ID="lblMessage" runat="server" Text='<%#Eval("MessageText") %>'></asp:Label>

                        </div>
                        
                    </ItemTemplate>
                </asp:Repeater>
                <!-- 
                    Below is a sample of what the results of the repeater should look like.

                    TODO: delete this when the repeater is functioning.

                     -->
                <div class='<%getCssClass(2, 1); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label1" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class='<%getCssClass(1, 2); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label2" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='<%getCssClass(2, 1); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label3" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class='<%getCssClass(1, 2); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label4" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='<%getCssClass(2, 1); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label5" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class='<%getCssClass(1, 2); %>'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label6" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='theirMessage'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label7" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class="myMessage"> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label8" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='theirMessage'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label9" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class="myMessage"> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label10" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='theirMessage'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label11" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class="myMessage"> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label12" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
                <div class='theirMessage'> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label13" runat="server" Text="Whatever I said, whatever I did, I didn't mean it"></asp:Label>
                </div>
                <div class="myMessage"> <!-- Return the CSS class from a method which compares the message's sender ID with the user's ID -->
                    <asp:Label ID="Label14" runat="server" Text="I just want you back for good"></asp:Label>
                </div>
            </div>
            <div id="myMessageInputWrapper">
                <div id="myMessageTxt">
                    <asp:TextBox ID="txtNewMessage" runat="server" TextMode="MultiLine" ForeColor="Black" Height="50px" Width="250px"></asp:TextBox>
                </div>
                <div id="myMessageSendBtn">
                    <asp:ImageButton ID="imgBtnSendMessage" runat="server" ImageUrl="~/Images/rsz_1008006-glossy-black-icon-arrows-arrowhead2-right.png"/>
                </div>
            </div>
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
        <div id="myConversations" visible="false" runat="server">
            <asp:Repeater ID="rptConversations" runat="server">
                <ItemTemplate>
                    <div class="conversationBox linkingDiv">
                        <asp:Image ID="imgTheirProfilePic" runat="server" CssClass="theirImage"/>
                        <asp:Label ID="lblTheirName" runat="server" Text='<%#getUsername2((Eval("SenderName")).ToString(),(Eval("ReceiverName")).ToString())%>' CssClass="theirName"></asp:Label>
                        <asp:Label ID="lblLastMessage" runat="server" Text='<%#Eval("Content") %>' CssClass="lastMessage"></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
                <!-- 
                    Below is a template of a sample message. It was designed with HtmlTextWriter in mind, which we are now not using.

                    I'm keeping it here as a temporary guide for the visual layout of each conversation summary.
                 -->
            
                <div class="conversationWrapper">
                <a>
                    <div class="conversationBox linkingDiv">
                        <div class="theirImage">
                            <img src="Images/blank-profile-grey.png" alt="User's profile picture"/>
                        </div>
                        <div class="theirName">
                            Stars Hollow
                        </div>
                        <asp:Label ID="lblTheirName" runat="server" Text='Respose.Write("");' CssClass="theirName"></asp:Label>
                        <div class="lastMessage">
                            Hi, welcome to our site!
                        </div>
                    </div>
                </a>
            </div>
                
        </div>
    </div>
</asp:Content>