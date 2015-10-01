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
        List<UserModel> foundUsers;
        int resultsAtATime = 20; /* In future features a control can be added to allow the user to set this value*/
        int resultsIndex = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
            searchManager = new BLLSearchMngr();
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }

            if (!IsPostBack)
            {
                SearchFor searchForPage = (SearchFor)this.PreviousPage;
                try
                {
                    foundUsers = searchManager.BLLSearchForUsersExact(searchForPage.AgeRange, searchForPage.Build, searchForPage.County, searchForPage.Gender,
                        searchForPage.Height, searchForPage.Profession, searchForPage.RelationshipStatus, searchForPage.SexualOrientation, searchForPage.Town, searchForPage.Hobbies);
                    
                    UpdateResultView();

                    attributeManager = new BLLAttributeMngr();
                    getAttributes();
                }
                catch (Exception)
                {
                    //Log error
                    Response.Redirect("404.aspx", false);
                }
            }
            else
            {
                foundUsers = (List<UserModel>)Session["UserSearchResults"];
                resultsAtATime = (int)Session["resultsAtATime"];
                resultsIndex = (int)Session["resultsIndex"];
            }
        }

        private void getAttributes()
        {
            try
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
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }
        }

        private void UpdateResultView()
        {
            rptResults.DataSource = foundUsers.Skip(resultsIndex).Take(resultsAtATime).ToList<UserModel>();
            rptResults.DataBind();

            if (foundUsers.Count < resultsAtATime)  resultsAtATime = foundUsers.Count;
            lblTotalNumResults.Text = "Found " + foundUsers.Count + " Results";
            lblShowingNumResults.Text = "Showing "+(resultsIndex+1)+"-" + (resultsIndex+resultsAtATime) + " of " + foundUsers.Count;

            Session["UserSearchResults"] = foundUsers;
            Session["resultsIndex"] = resultsIndex;
            Session["resultsAtATime"] = resultsAtATime;

            if (resultsIndex + resultsAtATime >= foundUsers.Count)
            {
                resultsAtATime = foundUsers.Count - resultsIndex;
            }

            btnNext.Visible = (resultsIndex + resultsAtATime < foundUsers.Count) ? true : false;
            btnLast.Visible = (resultsIndex + resultsAtATime < foundUsers.Count) ? true : false;
            btnPrev.Visible = (resultsIndex > 0) ? true : false;
            btnFirst.Visible = (resultsIndex > 0) ? true : false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            foundUsers = searchManager.BLLSearchForUsersExact(ddlAgeRange.SelectedValue, "", ddlCounty.SelectedValue, ddlGender.SelectedValue, "", txtProfession.Text, "", ddlOrientation.SelectedValue, txtTown.Text, null);
            resultsIndex = 0;
            UpdateResultView();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            resultsIndex = 0;
            UpdateResultView();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            resultsIndex -= resultsAtATime;
            UpdateResultView();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            resultsIndex += resultsAtATime;
            UpdateResultView();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            resultsIndex = foundUsers.Count - resultsAtATime;
            UpdateResultView();
        }
    }
}