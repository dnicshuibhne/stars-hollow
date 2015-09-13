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
        DataTable attributes;

        protected void Page_Load(object sender, EventArgs e)
        {
            searchManager = new BLLSearchMngr();
            attributeManager = new BLLAttributeMngr();
        }

        private void getAttributes()
        {

            attributes = attributeManager.BLLGetCounty();
            ddlCounty.DataSource = attributes;
            ddlCounty.DataTextField = Resources.COUNTY_COLUMN;
            ddlCounty.DataBind();

            attributes = attributeManager.BLLGetEyeColor();
            ddlEyeColor.DataSource = attributes;
            ddlEyeColor.DataTextField = Resources.EYE_COLOR_COLUMN;
            ddlEyeColor.DataBind();

            attributes = attributeManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataTextField = Resources.GENDER_COLUMN;
            ddlGender.DataBind();

            attributes = attributeManager.BLLGetHairColor();
            ddlHairColor.DataSource = attributes;
            ddlHairColor.DataTextField = Resources.HAIR_COLOR_COLUMN;
            ddlHairColor.DataBind();

            attributes = attributeManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataTextField = Resources.SEXUAL_ORIENTATION_COLUMN;
            ddlOrientation.DataBind();


            attributes = attributeManager.BLLGetRelationshipStatus();
            ddlRelationshipStatus.DataSource = attributes;
            ddlRelationshipStatus.DataTextField = Resources.RELATIONSHIP_STATUS_COLUMN;
            ddlRelationshipStatus.DataBind();


            attributes = attributeManager.BLLGetEthnicity();
            ddlEthnicity.DataSource = attributes;
            ddlEthnicity.DataTextField = Resources.ETHNICITY_COLUMN;
            ddlEthnicity.DataBind();


            //attributes = attributeManager.BLLGetHobbies();
            //cblHobbies.DataSource = attributes;
            //cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
            //cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
            //cblHobbies.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string queryString = "?";
            //queryString += Resources.TOWN_COLUMN + "=" + txtTown.Text + "&";
            queryString += Resources.COUNTY_COLUMN + "=" + ddlCounty.SelectedValue + "&";
            //queryString += Resources.PROFESSION_COLUMN+"="+txtProfession.Text+"&";
            queryString += Resources.GENDER_COLUMN + "=" + ddlGender.SelectedValue + "&";
            queryString += Resources.SEXUAL_ORIENTATION_COLUMN + "=" + ddlOrientation.SelectedValue + "&";
            //queryString += Resources.EYE_COLOR_COLUMN+"="+ddlEyeColour.SelectedValue+"&";
            //queryString += Resources.HAIR_COLOR_COLUMN+"="+ddlHairColour.SelectedValue+"&";
            //queryString += Resources.AGE_COLUMN+"="+ddlAge.SelectedValue+"&";
            //queryString += Resources.ETHNICITY_COLUMN+"="+ddlEthnicity.SelectedValue+"&";
            //queryString += Resources.RELATIONSHIP_STATUS_COLUMN+"="+ddlRelationshipStatus.SelectedValue;

            //foreach (ListItem hobby in cblHobbies.Items)
            //{
            //    if (hobby.Selected)
            //    {
            //        searchParams.Add(Resources.HOBBIES_ID_COLUMN,hobby.Text);
            //    }
            //}

            Response.Redirect("SearchResults.aspx"+queryString);
        }
    }
}