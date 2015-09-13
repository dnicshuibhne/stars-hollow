<%@ Page Title="" Language="C#" MasterPageFile="~/StarsHollow.master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphStarsHollowHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphStarsHollowBody" runat="server">


    <aside>
        <h5 id="asideheader">New Search</h5>
        <br />
        <asp:Label ID="lblTown" runat="server" Text="Town "></asp:Label>
        <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regxvLocation" runat="server" ControlToValidate="txtTown" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z0-9\s\,\.\-]+" ValidationGroup="vgRegisterPage1"><br /> Location may only contain the following characters: <br /> [A-Z] [a-z] [0-9] [space] [,] [.] [-]</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="County" runat="server" Text="County "></asp:Label>
        <asp:DropDownList ID="ddlCounty" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblProfesssion" runat="server" Text="Profession "></asp:Label>
        <asp:TextBox ID="txtProfession" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regxvProfession" runat="server" ControlToValidate="txtProfession" Display="Dynamic" CssClass="validator" ValidationExpression="[A-Za-z\s\-]+" ValidationGroup="vgRegisterPage1"><br /> Profession may only contain the following characters: <br /> [A-Z] [a-z] [space] [-]</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="lblGender" runat="server" Text="Gender "></asp:Label>
        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
        <br />
        <br />

        <asp:Label ID="lblOrientation" runat="server" Text="Orientation "></asp:Label>
        <asp:DropDownList ID="ddlOrientation" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblEyeColour" runat="server" Text="Eye colour "></asp:Label>
        <asp:DropDownList ID="ddlEyeColour" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblHairColour" runat="server" Text="Hair Colour "></asp:Label>
        <asp:DropDownList ID="ddlHairColour" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblAge" runat="server" Text="Age "></asp:Label>
        <asp:DropDownList ID="ddlAge" runat="server"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblHobbies" runat="server" Text="Hobbies "></asp:Label>
        <asp:CheckBoxList ID="cblHobbies" runat="server"></asp:CheckBoxList>
        <br />
        <br />
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="blueButton"/>
        <br />
        <br />
    </aside>
    <div id="bodyContents">
        <h2 id="pageHeader">Search Results</h2>
        <br />
        <section>
            <!-- Top panel -->
            <div class="detailsBox myMessagesWrapper">
                <div id="resultsTop">
                    <asp:Label ID="lblTotalNumResults" runat="server" Text="Found 20 Results"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblShowingNumResults" runat="server" Text="Showing 1-10 of 20..."></asp:Label>
                </div>
            </div>

            <!-- Results repeater -->
            <div class="detailsBox myMessagesWrapper">
                <asp:Repeater ID="rptResults" runat="server">
                    <ItemTemplate>
                        <a href='ViewMatchProfile.aspx?<%#Eval("Username") %>'>
                            <div class="resultsBox linkingDiv">
                                <asp:Image ID="imgProfilePic" runat="server" CssClass="resultImage" />
                                <div class="resultText">
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Username") %>' CssClass="resultName"></asp:Label>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' CssClass="resultLocation"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblProfession" runat="server" Text='<%#Eval("Profession") %>' CssClass="resultProfession"></asp:Label>
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Demonstration of appearance and layout -->
            <!-- TODO: delete this when repeater is functioning

            <div class="detailsBox myMessagesWrapper">
                <a>
                    <div class="resultBox linkingDiv">
                        <asp:Image ID="imgProfilePic2" runat="server" ImageUrl="~/Images/blank-profile-grey.png" CssClass="resultImage"/>    
                        <div class="resultText">
                            <asp:Label ID="lblName2" runat="server" Text="Test Name" CssClass="resultName"></asp:Label>
                            <asp:Label ID="lblLocation2" runat="server" Text="Dublin" CssClass="resultLocation"></asp:Label>
                            <br />
                            <asp:Label ID="lblProfession2" runat="server" Text="Spaceman" CssClass="resultProfession"></asp:Label>
                        </div>
                    </div>
                </a>
            </div> -->

            <!-- Bottom panel -->
            <div class="detailsBox myMessagesWrapper">
                <div id="resultsBottom">
                    <asp:Button ID="btnFirst" runat="server" Text="First Page" CssClass="blueButton "/>
                    <asp:Button ID="btnPrev" runat="server" Text="Previous Page" CssClass="blueButton "/>

                    <!-- Using a repeater for the page numbers. A link to a tutorial is here: http://www.developer.com/net/asp/article.php/3646011/ASPNET-Tip-Creating-Paging-for-a-Repeater-Control.htm -->
                    <asp:Repeater ID="rptResultsPages" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbtnPage" runat="server"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Button ID="btnNext" runat="server" Text="Next Page" CssClass="blueButton "/>
                    <asp:Button ID="btnLast" runat="server" Text="Last Page" CssClass="blueButton "/>
                </div>
            </div>

        </section>
    </div>
</asp:Content>
