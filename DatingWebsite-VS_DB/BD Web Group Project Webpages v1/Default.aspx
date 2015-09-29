<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphDefaultHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphDefaultBody" runat="server">

    <!-- added id="loginScreen" -->
    <div id="loginScreen" class="loginScreen" runat="server" visible="False"  >

        <!-- .loginScreen should set to 'display: none;' on page load, and when btnCancel is clicked.
            Its display should set to 'inline' when btnLogin is clicked.
            -->

        <section class="loginSection">
            <div class="loginContents">
                <h3>Login</h3>
                <br />
                <br />
                <asp:Label ID="valLogin" runat="server" Text="Invalid Username/Password" Visible="False" ForeColor="Red"></asp:Label>
                <!-- lblLoginUsername was Label1 -->
                <asp:Label ID="lblLoginUsername" runat="server" Text="Username: "></asp:Label>
                <!-- txtLoginUsername was TextBox1 -->
                <asp:TextBox ID="txtLoginUsername" runat="server" CssClass="loginTextBox"></asp:TextBox>
                <!-- lblLoginPassword was lblPassword -->
                <asp:Label ID="lblLoginPassword" runat="server" Text="Password: "></asp:Label>
                <!-- txtLoginPassword was txtPassword -->
                <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="loginTextBox" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <div class="loginButtons">
                    <asp:Button ID="btnCancel" runat="server" CssClass="blueButton" Font-Size="20px" Text="Cancel" Style="padding: .3em 2em;" OnClick="btnCancelLogin_Click" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="blueButton" Font-Size="20px" Text="Login" Style="padding: .3em 2em;" OnClick="btnSubmitLogin_Click" />
                </div>
            </div>
        </section>
    </div>

    <!-- The .defaultPgMainForm CssClass is an 'empty' box taking up the height of the screen 
        which pushes subsequent content down the page.  -->

    <div class="defaultPgMainForm">

        <!-- The #mainFormBox div is where the registry form is located. 
            It is positioned fixed on-screen, and has a lower z-index than the rest so that
            when the user scrolls down the page, #mainFormBox is obscured by subsequent content.-->

        <div id="mainFormBox">
            <div class="mainFormBuffer">
              
                <asp:Button ID="btnLogin" runat="server" Text="LOGIN" Font-Size="15px" CssClass="blueButton" Style='float: right; padding: 1vh 4vw; margin: 20px 30px; position: relative;' OnClick="btnOpenLogin_Click" />
                    
                <br />
                <br />
                <br />
                <img src="Images/DreamDate.png" class="defaultSiteImg" />
            </div>
            <div class="mainFormMiddle">
                <section class="loginSection">

                    <!-- #loginPage1 is initially visible, 
                    while #loginPage2 is initially invisible -->

                    <div id="loginPage1" runat="server" class="loginContents" >
                        <asp:Label ID="lblUsername" runat="server" Text="Username " CssClass="loginControls"></asp:Label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regxvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9]+" ValidationGroup="vgRegisterPage1"> Your username may only contain letters and numbers</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Required</asp:RequiredFieldValidator>
                        <%--<asp:Label ID="valUserAvail" runat="server" Text="This username is taken, please try another." style="font: 12px arial " CssClass="validator" ForeColor="Red" Visible="False"></asp:Label>--%>
                        <asp:CustomValidator ID="valUserAvail" runat="server" CssClass="validator" Display="Dynamic" ControlToValidate="txtUserName" ValidationGroup="vgRegisterPage1"> This username is taken, please try another.</asp:CustomValidator>
                        <br />

                        <asp:Label ID="lblIAmA" runat="server" Text="I am a " CssClass="loginControls"></asp:Label>
                        <asp:DropDownList ID="ddlOrientation" runat="server" AppendDataBoundItems="True" Style="width: 114px;" ValidationGroup="vgRegisterPage1"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                        <asp:DropDownList ID="ddlGender" runat="server" AppendDataBoundItems="True" Style="width: 114px;" ValidationGroup="vgRegisterPage1"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvOrientation" runat="server" ControlToValidate="ddlOrientation" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Please select your Orientation</asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Please select your Gender</asp:RequiredFieldValidator>
                        <br />

                        <asp:Label ID="lblCounty" runat="server" Text="County "></asp:Label>
                        <asp:DropDownList ID="ddlCounty" runat="server" AppendDataBoundItems="True" Style="width: 114px;" ValidationGroup="vgRegisterPage1"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCounty" runat="server" ControlToValidate="ddlCounty" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Please select your County</asp:RequiredFieldValidator>
                        <br />
                        <br />

                        <!-- On pressing the btnContinueReg button, 
                        #loginPage1 div is hidden and #loginPage2 div is shown -->

                        <div class="loginButtons">
                            <asp:Button ID="btnContinueReg" runat="server" Text="Continue" CssClass="blueButton" Font-Size="20px" Style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" ValidationGroup="vgRegisterPage1" OnClick="btnContinueReg_Click" />
                        </div>
                    </div>
                    <div id="loginPage2" runat="server" class="loginContents" visible="false">
                        <asp:Label ID="lblEmail" runat="server" Text="Email " CssClass="loginControls"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regxvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgRegisterPage2">Please enter a valid email address, eg. example@web.com</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Required</asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblCreatePwd" runat="server" Text="Password" CssClass="loginControls"></asp:Label>
                        <asp:TextBox ID="txtCreatePwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2" TextMode="Password"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regxvCreatePwd" runat="server" ControlToValidate="txtCreatePwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgRegisterPage2"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvCreatePwd" runat="server" ControlToValidate="txtCreatePwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Required</asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password" CssClass="loginControls"></asp:Label>
                        <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2" TextMode="Password" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regxvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgRegisterPage2"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="cvConfirmPwd" runat="server" ControlToCompare="txtCreatePwd" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Your passwords don&#39;t match</asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Required</asp:RequiredFieldValidator>
                        <br />
                        <br />

                        <!-- On pressing the btnBack button, 
                         #loginPage2 div is hidden and #loginPage1 div is shown.
                         On pressing the btnRegister button, 
                         the new user is created in the Database and the website directs the user 
                         to their dashboard, where further personal details can be filled in -->

                        <div class="loginButtons">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="blueButton" Font-Size="20px" Style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" OnClick="btnBack_Click" />
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="blueButton" Font-Size="20px" Style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" ValidationGroup="vgRegisterPage2" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </section>
            </div>

            <div class="mainFormBuffer"></div>
        </div>
    </div>

    <div id="defaultFadeInBG"></div>

    <!-- Additional 'information cards' can be inserted as required -->

    <div id="defaultPgAboutUs">

        <!-- This will link to an About Us page -->
        <div class="defaultCardBuffer"></div>
        <div class="defaultTextBox">
            <h1>About us</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed cursus tellus. Proin quis bibendum tortor. Morbi quis pulvinar ex. 
                Suspendisse mollis ullamcorper mauris a volutpat. Morbi nec orci quis elit mollis ultrices et sit amet ante. Nunc sodales diam lacinia maximus efficitur. 
                Pellentesque consectetur, justo nec ornare euismod, ante ligula maximus libero, sit amet gravida odio orci at ipsum.
            </p>
        </div>
        <div class="defaultCardBuffer"></div>
    </div>
    <div id="defaultPgMatch">

        <!-- This is a placeholder for additional features/information -->
        <div class="defaultCardBuffer"></div>
        <div class="defaultTextBox">
            <h1>Find your match</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed cursus tellus. Proin quis bibendum tortor. Morbi quis pulvinar ex. 
                Suspendisse mollis ullamcorper mauris a volutpat. Morbi nec orci quis elit mollis ultrices et sit amet ante. Nunc sodales diam lacinia maximus efficitur. 
                Pellentesque consectetur, justo nec ornare euismod, ante ligula maximus libero, sit amet gravida odio orci at ipsum.
            </p>
        </div>
        <div class="defaultCardBuffer"></div>
    </div>

    <div id="defaultFadeOutBG"></div>

    <!-- A final 'empty' div is required to present the registry form once 
        the user has scrolled to the bottom of the page -->

    <div class="defaultPgMainForm">
    </div>
</asp:Content>
