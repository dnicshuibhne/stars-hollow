using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using ResourceTier;
using DataModels;
using System.Data;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class SearchFor : System.Web.UI.Page
    {
        BLLSearchMngr searchManager;
        BLLAttributeMngr attributeManager;
        //DataTable attributes;
        List<string> attributes;

        protected void Page_Load(object sender, EventArgs e)
        {
            searchManager = new BLLSearchMngr();
            attributeManager = new BLLAttributeMngr();
            getAttributes();
        }

        private void getAttributes()
        {
            attributes = attributeManager.BLLGetAgeRange();
            ddlAgeRange.DataSource = attributes;
            ddlAgeRange.DataBind();

            attributes = attributeManager.BLLGetBuild();
            ddlBuild.DataSource = attributes;
            ddlBuild.DataBind();

            attributes = attributeManager.BLLGetCounty();
            ddlCounty.DataSource = attributes;
            ddlCounty.DataBind();

            attributes = attributeManager.BLLGetEthnicity();
            ddlEthnicity.DataSource = attributes;
            ddlEthnicity.DataBind();

            attributes = attributeManager.BLLGetEyeColor();
            ddlEyeColor.DataSource = attributes;
            ddlEyeColor.DataBind();

            attributes = attributeManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataBind();

            attributes = attributeManager.BLLGetHairColor();
            ddlHairColor.DataSource = attributes;
            ddlHairColor.DataBind();

            attributes = attributeManager.BLLGetHeight();
            ddlHeight.DataSource = attributes;
            ddlHeight.DataBind();

            attributes = attributeManager.BLLGetRelationshipStatus();
            ddlRelationshipStatus.DataSource = attributes;
            ddlRelationshipStatus.DataBind();

            attributes = attributeManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataBind();
            
            cblHobbies.DataSource = attributeManager.BLLGetHobbies();
            cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
            cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
            cblHobbies.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string queryString = "";
            queryString += Resources.AGE_RANGE_COLUMN + "=" + ddlAgeRange.SelectedValue + "&";
            queryString += Resources.BUILD_COLUMN + "=" + ddlBuild.SelectedValue + "&";
            queryString += Resources.COUNTY_COLUMN + "=" + ddlCounty.SelectedValue + "&";
            queryString += Resources.ETHNICITY_COLUMN + "=" + ddlEthnicity.SelectedValue + "&";
            queryString += Resources.EYE_COLOR_COLUMN + "=" + ddlEyeColor.SelectedValue + "&";
            queryString += Resources.GENDER_COLUMN + "=" + ddlGender.SelectedValue + "&";
            queryString += Resources.HAIR_COLOR_COLUMN + "=" + ddlHairColor.SelectedValue + "&";
            queryString += Resources.HEIGHT_COLUMN + "=" + ddlHeight.SelectedValue + "&";
            queryString += Resources.PROFESSION_COLUMN + "=" + txtProfession.Text + "&";
            queryString += Resources.RELATIONSHIP_STATUS_COLUMN + "=" + ddlRelationshipStatus.SelectedValue + "&";
            queryString += Resources.SEXUAL_ORIENTATION_COLUMN + "=" + ddlOrientation.SelectedValue + "&";
            queryString += Resources.TOWN_COLUMN + "=" + txtTown.Text + "&";

            //queryString += Resources.AGE_RANGE_COLUMN + "=" + Server.UrlEncode(ddlAgeRange.SelectedValue) + "&";
            //queryString += Resources.BUILD_COLUMN + "=" + Server.UrlEncode(ddlBuild.SelectedValue) + "&";
            //queryString += Resources.COUNTY_COLUMN + "=" + Server.UrlEncode(ddlCounty.SelectedValue) + "&";
            //queryString += Resources.ETHNICITY_COLUMN + "=" + Server.UrlEncode(ddlEthnicity.SelectedValue) + "&";
            //queryString += Resources.EYE_COLOR_COLUMN + "=" + Server.UrlEncode(ddlEyeColor.SelectedValue) + "&";
            //queryString += Resources.GENDER_COLUMN + "=" + Server.UrlEncode(ddlGender.SelectedValue) + "&";
            //queryString += Resources.HAIR_COLOR_COLUMN + "=" + Server.UrlEncode(ddlHairColor.SelectedValue) + "&";
            //queryString += Resources.HEIGHT_COLUMN + "=" + Server.UrlEncode(ddlHeight.SelectedValue) + "&";
            //queryString += Resources.PROFESSION_COLUMN + "=" + Server.UrlEncode(txtProfession.Text) + "&";
            //queryString += Resources.RELATIONSHIP_STATUS_COLUMN + "=" + Server.UrlEncode(ddlRelationshipStatus.SelectedValue) + "&";
            //queryString += Resources.SEXUAL_ORIENTATION_COLUMN + "=" + Server.UrlEncode(ddlOrientation.SelectedValue) + "&";
            //queryString += Resources.TOWN_COLUMN + "=" + Server.UrlEncode(txtTown.Text) + "&";

            //foreach (ListItem hobby in cblHobbies.Items)
            //{
            //    if (hobby.Selected)
            //    {
            //        searchParams.Add(Resources.HOBBIES_ID_COLUMN,hobby.Text);
            //    }
            //}
            queryString = queryString.Substring(0, queryString.Length - 2);
            Response.Redirect("SearchResults.aspx?" + queryString);
        }
    }
}