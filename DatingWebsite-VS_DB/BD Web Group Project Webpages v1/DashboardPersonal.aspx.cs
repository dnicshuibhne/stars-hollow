using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using System.Data;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class DashboardPersonal : System.Web.UI.Page
    {
        // Attribute column names
        private const string AGE_RANGE_COLUMN = "AgeRange";
        private const string BUILD_COLUMN = "Build";
        private const string EYE_COLOR_COLUMN = "EyeColor";
        private const string GENDER_COLUMN = "Gender";
        private const string HAIR_COLOR_COLUMN = "HairColor";
        private const string HEIGHT_COLUMN = "Height";
        private const string HOBBIES_ID_COLUMN = "HobbyID";
        private const string HOBBIES_NAME_COLUMN = "HobbyName";
        private const string SEXUAL_ORIENTATION_COLUMN = "Orientation";

        BLLAttributeMngr attManager;
        DataSet attributes;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Retrieve and load the values of each attribute*/
            attManager = new BLLAttributeMngr();

            attributes = attManager.BLLGetAgeRange();
            ddlAge.DataSource = attributes;
            ddlAge.DataTextField = AGE_RANGE_COLUMN;
            ddlAge.DataBind();

            attributes = attManager.BLLGetEyeColor();
            ddlEyeColor.DataSource = attributes;
            ddlEyeColor.DataTextField = EYE_COLOR_COLUMN;
            ddlEyeColor.DataBind();

            attributes = attManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataTextField = GENDER_COLUMN;
            ddlGender.DataBind();

            attributes = attManager.BLLGetHairColor();
            ddlHairColor.DataSource = attributes;
            ddlHairColor.DataTextField = HAIR_COLOR_COLUMN;
            ddlHairColor.DataBind();

            attributes = attManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataTextField = SEXUAL_ORIENTATION_COLUMN;
            ddlOrientation.DataBind();

            attributes = attManager.BLLGetHobbies();
            cblHobbies.DataSource = attributes;
            cblHobbies.DataValueField = HOBBIES_ID_COLUMN;
            cblHobbies.DataTextField = HOBBIES_NAME_COLUMN;
            cblHobbies.DataBind();


        }
    }
}