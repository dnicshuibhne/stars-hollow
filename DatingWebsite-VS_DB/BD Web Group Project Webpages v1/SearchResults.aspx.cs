using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using DataModels;
using BLL;
using ResourceTier;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class SearchResults : System.Web.UI.Page
    {
        BLLSearchMngr searchManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchManager = new BLLSearchMngr();

            SearchFor searchForPage = (SearchFor)this.PreviousPage;

            List<UserModel> foundUsers;
            try
            {
                foundUsers = searchManager.BLLSearchForUsersExact(searchForPage.AgeRange, searchForPage.Build,searchForPage.County,searchForPage.Gender,
                    searchForPage.Height,searchForPage.Profession,searchForPage.RelationshipStatus,searchForPage.SexualOrientation,searchForPage.Town,null);
            }
            catch(SqlException e2)
            {
                throw;//???
            }
            
            rptResults.DataSource = foundUsers;
            rptResults.DataBind();
        }
    }
}