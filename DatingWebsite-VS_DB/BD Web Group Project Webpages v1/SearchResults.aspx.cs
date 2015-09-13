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

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class SearchResults : System.Web.UI.Page
    {
        BLLSearchMngr searchManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchManager = new BLLSearchMngr();

            NameValueCollection searchParams = Request.Params;

            //List<UserModel> foundUsers = searchManager.SearchForUsers(searchParams, hobbies);
            DataTable foundUsers = searchManager.SearchForUsers(searchParams);
            rptResults.DataSource = foundUsers;
            rptResults.DataBind();
        }
    }
}