<%@ Page Title="" Language="C#" MasterPageFile="~/StarsHollow.master" AutoEventWireup="true" CodeBehind="RSSNews.aspx.cs" Inherits="BD_Web_Group_Project_Webpages_v1.RSSHoroscope" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphStarsHollowHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphStarsHollowBody" runat="server">

    <h2 id="pageHeader">RSS News</h2>
    <section>
        <div id="rss">
            <asp:XmlDataSource ID="xmldsNews" runat="server" DataFile="http://www.rte.ie/news/rss/news-headlines.xml" XPath="rss/channel/item[position()<=15]"></asp:XmlDataSource>
            <asp:DataList ID="dlNews" runat="server" CellPadding="10" DataSourceID="xmldsNews" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" CellSpacing="5" CssClass="rss" Width="400px" HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#XPath("link") %>'> 
                        <h4> <%#XPath("title") %></h4>
                    </asp:HyperLink><br />   
                    <%#XPath("pubDate") %>
                    <br />
                    <br />
                    <%#XPath("description") %>
                    <br />
                </ItemTemplate>
                <AlternatingItemStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </div>
    </section>

</asp:Content>
