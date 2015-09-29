<%@ Page Title="" Language="C#" MasterPageFile="~/StarsHollow.master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphStarsHollowHead" runat="server">
    <style type="text/css">
        .blueButton {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphStarsHollowBody" runat="server">


    <aside>
        <div id="resultsAsideWrapper">
            <div id="resultsAsideInnards">
                <h5 class="resultsAsideBookend">New Search</h5>
                <br />
                <asp:Label ID="lblTown" runat="server" Text="Town "></asp:Label>
                <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvLocation" runat="server" ControlToValidate="txtTown" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"><br /> Town may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblCounty" runat="server" Text="County "></asp:Label>
                <asp:DropDownList ID="ddlCounty" runat="server" AppendDataBoundItems="True"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblProfesssion" runat="server" Text="Profession "></asp:Label>
                <asp:TextBox ID="txtProfession" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regxvProfession" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br /> Profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="lblGender" runat="server" Text="Gender "></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server" AppendDataBoundItems="True"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblOrientation" runat="server" Text="Orientation "></asp:Label>
                <asp:DropDownList ID="ddlOrientation" runat="server" AppendDataBoundItems="True"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblAgeRange" runat="server" Text="Age "></asp:Label>
                <asp:DropDownList ID="ddlAgeRange" runat="server" AppendDataBoundItems="True"><asp:ListItem Text="-- pick one --" Value=""></asp:ListItem></asp:DropDownList>
                <br />
                <br />
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="blueButton" OnClick="btnSearch_Click"/>
                <br />
                <br />
            </div>
        </div>
    </aside>
    <div id="bodyContents">
        <h2 id="pageHeader">Search Results</h2>
        <br />
        <section>
            <!-- Top panel -->
            <div class="detailsBox myMessagesWrapper">
                <div id="resultsTop">
                    <asp:Label ID="lblTotalNumResults" runat="server" Text="Found 0 Results"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblShowingNumResults" runat="server"></asp:Label>
                </div>
            </div>

            <!-- Results repeater -->
            <div class="contentWrapper">
                <asp:Repeater ID="rptResults" runat="server">
                    <ItemTemplate>
                        <a href='ViewMatchProfile.aspx?<%#Eval("Username") %>'>
                            <div class="resultBox linkingDiv">
                                <asp:Image ID="imgProfilePic" runat="server" CssClass="resultImage"/>
                                <div class="resultText">
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Username") %>' CssClass="resultName"></asp:Label>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("County") %>' CssClass="resultLocation"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblProfession" runat="server" Text='<%#Eval("Profession") %>' CssClass="resultProfession"></asp:Label>
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Bottom panel -->
            <div class="contentWrapper">
                <div id="resultsBottom">
                    <asp:Button ID="btnFirst" runat="server" Text="First" CssClass="blueButton " OnClick="btnFirst_Click"/>
                    <asp:Button ID="btnPrev" runat="server" Text="Previous" CssClass="blueButton " OnClick="btnPrev_Click"/>

                    <!-- Using a repeater for the page numbers. A link to a tutorial is here: http://www.developer.com/net/asp/article.php/3646011/ASPNET-Tip-Creating-Paging-for-a-Repeater-Control.htm -->
                    <asp:Repeater ID="rptResultsPages" runat="server">
                        <ItemTemplate>

                            <!-- TODO: ensure this LinkButton is styled á la .resultsPageNumber -->

                            <asp:LinkButton ID="lkbtnPage" runat="server"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="blueButton " OnClick="btnNext_Click"/>
                    <asp:Button ID="btnLast" runat="server" Text="Last" CssClass="blueButton " OnClick="btnLast_Click"/>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
