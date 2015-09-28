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
        BLLAttributeMngr attributeManager;
        List<string> attributes;

        protected void Page_Load(object sender, EventArgs e)
        {
            searchManager = new BLLSearchMngr();
            List<UserModel> foundUsers;


            if (!IsPostBack)
            {
                SearchFor searchForPage = (SearchFor)this.PreviousPage;
                try
                {
                    foundUsers = searchManager.BLLSearchForUsersExact(searchForPage.AgeRange, searchForPage.Build, searchForPage.County, searchForPage.Gender,
                        searchForPage.Height, searchForPage.Profession, searchForPage.RelationshipStatus, searchForPage.SexualOrientation, searchForPage.Town, null);
                }
                catch (SqlException e2)
                {
                    throw;//???
                }
            }
            else
            {
                foundUsers = searchManager.BLLSearchForUsersExact(ddlAgeRange.SelectedValue, "", ddlCounty.SelectedValue, ddlGender.SelectedValue, "", txtProfession.Text, "", ddlOrientation.SelectedValue, txtTown.Text, null);
            }
            
            rptResults.DataSource = foundUsers;
            rptResults.DataBind();

            if (!IsPostBack)
            {
                try
                {
                    attributeManager = new BLLAttributeMngr();
                }
                catch (Exception e3)
                {
                    throw;
                }
                getAttributes();
            }
        }
        private void getAttributes()
        {
            attributes = attributeManager.BLLGetAgeRange();
            ddlAgeRange.DataSource = attributes;
            ddlAgeRange.DataBind();

            attributes = attributeManager.BLLGetCounty();
            ddlCounty.DataSource = attributes;
            ddlCounty.DataBind();

            attributes = attributeManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataBind();

            attributes = attributeManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}