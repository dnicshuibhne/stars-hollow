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
        List<string> attributes;
        UserModel user;

        protected void Page_Load(object sender, EventArgs e)
        {
            /* check if logged in*/
            user = (UserModel)Session[Resources.USER_SESSION_STATE];
            if (user == null || user.ID < 1)
            {
                Response.Redirect("Default.aspx", true);
            }

            searchManager = new BLLSearchMngr();
            attributeManager = new BLLAttributeMngr();
            getAttributes();
        }

        private void getAttributes()
        {
            //attributes = attributeManager.BLLGetAgeRange();
            //ddlAgeRange.DataSource = attributes;
            //ddlAgeRange.DataBind();

            //attributes = attributeManager.BLLGetBuild();
            //ddlBuild.DataSource = attributes;
            //ddlBuild.DataBind();

            attributes = attributeManager.BLLGetCounty();
            ddlCounty.DataSource = attributes;
            ddlCounty.DataBind();

            attributes = attributeManager.BLLGetEthnicity();
            ddlEthnicity.DataSource = attributes;
            ddlEthnicity.DataBind();

            //attributes = attributeManager.BLLGetEyeColor();
            //ddlEyeColor.DataSource = attributes;
            //ddlEyeColor.DataBind();

            attributes = attributeManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataBind();

            //attributes = attributeManager.BLLGetHairColor();
            //ddlHairColor.DataSource = attributes;
            //ddlHairColor.DataBind();

            //attributes = attributeManager.BLLGetHeight();
            //ddlHeight.DataSource = attributes;
            //ddlHeight.DataBind();

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
            
        }
    }
}