<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="DashboardAccount.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.DashboardAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphDashboardMain" runat="server">

    <!-- This page is for the user to update their Account Details 
        following initial registration. -->

    <h4>Edit Account Details</h4>
    <br />
    <div class="contentWrapper">
        <div class="detailsBoxOutline">
            <asp:Label ID="lblEmail" runat="server" Text="Email Address " ></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="loginTextBox" ValidationGroup="vgUpdateEmail" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="regxvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgUpdateEmail">Please enter a valid email address, eg. example@web.com</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdateEmail"> Required</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblNewEmail" runat="server" Text="New Email Address " ></asp:Label>
            <asp:TextBox ID="txtNewEmail" runat="server" CssClass="loginTextBox" ValidationGroup="vgUpdateEmail" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="regxvNewEmail" runat="server" ControlToValidate="txtNewEmail" Display="Dynamic" CssClass="validator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgUpdateEmail">Please enter a valid email address, eg. example@web.com</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rtfvNewEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdateEmail"> Required</asp:RequiredFieldValidator>
            <asp:Label ID="lblChangeEmailFeedback" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="btnUpdateEmail" runat="server" Text="Update Email" ValidationGroup="vgUpdateEmail" CssClass="blueButton dashboardButton" OnClick="btnUpdateEmail_Click"/>
            <br />
            <br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="detailsBoxOutline">
            <br />
            <br />
            <asp:Label ID="lblCurrentPwd" runat="server" Text="Current Password " ></asp:Label>
            <asp:TextBox ID="txtCurrentPwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgUpdatePwd" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="regxvCurrentPwd" runat="server" ControlToValidate="txtCurrentPwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgUpdatePwd"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvCurrentPwd" runat="server" ControlToValidate="txtCurrentPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdatePwd"> Required</asp:RequiredFieldValidator>
            <br />      
            <asp:Label ID="lblNewPwd" runat="server" Text="New Password " ></asp:Label>
            <asp:TextBox ID="txtNewPwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgUpdatePwd" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="regxvNewPwd" runat="server" ControlToValidate="txtNewPwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgUpdatePwd"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ControlToValidate="txtNewPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdatePwd"> Required</asp:RequiredFieldValidator>
            <br />      
            <asp:Label ID="lblConfirmPwd" runat="server" Text="Confirm Password " ></asp:Label>
            <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="loginTextBox" ValidationGroup="vgUpdatePwd" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="regxvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9_\s\!\@]{6,12}" ValidationGroup="vgUpdatePwd"> Your password must be 6-12 characters long and may only contain the following characters: [A-Z] [a-z] [0-9] [_] [!] [@]</asp:RegularExpressionValidator>
                <asp:CompareValidator ID="cvConfirmPwd" runat="server" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdatePwd"> Your passwords don\'t match</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" Display="Dynamic" CssClass="validator" ValidationGroup="vgUpdatePwd"> Required</asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnUpdatePwd" runat="server" Text="Set New Password" ValidationGroup="vgUpdatePwd" CssClass="blueButton dashboardButton" OnClick="btnUpdatePwd_Click"/>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
