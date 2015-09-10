<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDefaultHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphDefaultBody" runat="server">
    
    <div id="loginScreen" class="loginScreen" runat="server">

        <!-- .loginScreen should set to 'display: none;' on page load, and when btnCancel is clicked.
            Its display should set to 'inline' when btnLogin is clicked.
            -->

        <section class="loginSection">
            <div class="loginContents">
                <h3>Login</h3>
                <br />
                <br />
                <asp:Label ID="valLogin" runat="server" Text="Invalid Username/Password" Visible="False" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblloginUsername" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="txtLoginUsername" runat="server" CssClass="loginTextBox" ></asp:TextBox>
                <asp:Label ID="lblLoginPassword" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="loginTextBox" ></asp:TextBox>
                <br />
                <br />
                <div class="loginButtons">
                    <asp:Button ID="btnCancel" runat="server" CssClass="blueButton" Font-Size="20px" Text="Cancel" style="padding: .3em 2em;" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="blueButton" Font-Size="20px" Text="Login" style="padding: .3em 2em;" OnClick="btnSubmit_Click" />
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
            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" Font-Size="15px" CssClass="blueButton" style="float: right; padding: 5px 20px; margin: 20px 30px; position: relative;" OnClick="btnLogin_Click"/>
            <br />
            <img src="Images/BD%20Web%20Sitename%20Placeholder%20Large.png" style="display: block;  margin-left:auto; margin-right:auto; margin-top: 40px"/>
            <section class="loginSection">
        
                <!-- #loginPage1 is initially visible, 
                    while #loginPage2 is initially invisible -->
                
                <div id="loginPage1" runat="server" class="loginContents">
                    <asp:Label ID="lblUsername" runat="server" Text="Username " ></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage1" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regxvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9]+" ValidationGroup="vgRegisterPage1"> Your username may only contain letters and numbers</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Required</asp:RequiredFieldValidator>
                    <asp:Label ID="valUserAvail" runat="server" Text="This username is taken, please try another." style="font: 12px arial " CssClass="validator" ForeColor="Red" Visible="False"></asp:Label>
                    <%--<asp:CustomValidator ID="valUserAvail" runat="server" ErrorMessage="This username is taken, please try another." Display="Dynamic"></asp:CustomValidator>--%>
                    <br />            
                    <asp:Label ID="lblIAmA" runat="server" Text="I am a " ></asp:Label>
                    <asp:DropDownList ID="ddlOrientation" runat="server" style="width: 114px;" ValidationGroup="vgRegisterPage1"></asp:DropDownList>
                    <asp:DropDownList ID="ddlGender" runat="server" style="width: 114px;" ValidationGroup="vgRegisterPage1"></asp:DropDownList>        
                    <asp:RequiredFieldValidator ID="rfvOrientation" runat="server" ControlToValidate="ddlOrientation" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Please select your Orientation</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Please select your Gender</asp:RequiredFieldValidator>
                    <br />      
                    <asp:Label ID="lblLocation" runat="server" Text="Location " ></asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage1" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regxvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"> Your location may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage1"> Required</asp:RequiredFieldValidator>
                    <br />        
                    <br />        
                    
                    <!-- On pressing the btnContinueReg button, 
                        #loginPage1 div is hidden and #loginPage2 div is shown -->
                    
                    <div class="loginButtons">
                        <asp:Button ID="btnContinueReg" runat="server" Text="Continue" CssClass="blueButton" Font-Size="20px" style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" ValidationGroup="vgRegisterPage1" OnClick="btnContinueReg_Click"/>
                    </div>
                </div>
                <div id="loginPage2" runat="server" class="loginContents">
                    <asp:Label ID="lblEmail" runat="server" Text="Email " ></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regxvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgRegisterPage2">Please enter a valid email address, eg. example@web.com</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Required</asp:RequiredFieldValidator>
                    <br />            
                    <asp:Label ID="lblCreatePwd" runat="server" Text="Password" ></asp:Label>
                    <asp:TextBox ID="txtCreatePwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regxvCreatePwd" runat="server" ControlToValidate="txtCreatePwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgRegisterPage2"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvCreatePwd" runat="server" ControlToValidate="txtCreatePwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgRegisterPage2"> Required</asp:RequiredFieldValidator>
                    <br />      
                    <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password" ></asp:Label>
                    <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgRegisterPage2" ></asp:TextBox>
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
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="blueButton" Font-Size="20px" style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" OnClick="btnBack_Click"/>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="blueButton" Font-Size="20px" style="margin-left: auto; margin-right: auto; padding-left: 2em; padding-right: 2em;" ValidationGroup="vgRegisterPage2" OnClick="btnRegister_Click"/>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- Additional 'information cards' can be inserted as required -->
    
    <div id="defaultPgAboutUs">
        
        <!-- This will link to an About Us page -->
        
        <div id="defaultPgAboutUsContents">    
            <h1>About us</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed cursus tellus. Proin quis bibendum tortor. Morbi quis pulvinar ex. 
                Suspendisse mollis ullamcorper mauris a volutpat. Morbi nec orci quis elit mollis ultrices et sit amet ante. Nunc sodales diam lacinia maximus efficitur. 
                Pellentesque consectetur, justo nec ornare euismod, ante ligula maximus libero, sit amet gravida odio orci at ipsum.
            </p>
        </div>
    </div>
    <div id="defaultPgMatch">
        
        <!-- This is a placeholder for additional features/information -->
        
        <div id="defaultPgMatchContents">
            <h1>Find your match</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed cursus tellus. Proin quis bibendum tortor. Morbi quis pulvinar ex. 
                Suspendisse mollis ullamcorper mauris a volutpat. Morbi nec orci quis elit mollis ultrices et sit amet ante. Nunc sodales diam lacinia maximus efficitur. 
                Pellentesque consectetur, justo nec ornare euismod, ante ligula maximus libero, sit amet gravida odio orci at ipsum.
            </p>
        </div>
    </div>
    
    <!-- A final 'empty' div is required to present the registry form once 
        the user has scrolled to the bottom of the page -->
    
    <div class="defaultPgMainForm">
    </div>
</asp:Content>