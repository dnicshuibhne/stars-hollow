using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using System.Data;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        private const string AGE_RANGE_COLUMN = "AgeRange";
        private const string BUILD_COLUMN = "Build";
        private const string EYE_COLOR_COLUMN = "EyeColour";
        private const string GENDER_COLUMN = "Gender";
        private const string HAIR_COLOR_COLUMN = "HairColour";
        private const string HEIGHT_COLUMN = "Height";
        private const string HOBBIES_COLUMN = "HobbyName";
        private const string SEXUAL_ORIENTATION_COLUMN = "Orientation";

        protected void Page_Load(object sender, EventArgs e)
        {
            BLLUserMngr m = new BLLUserMngr();
            DataSet attributes;
            
            attributes= m.BLLGetAgeRange();
            ddlAgeRange.DataSource = attributes;
            ddlAgeRange.DataTextField = AGE_RANGE_COLUMN;
            ddlAgeRange.DataBind();

            attributes = m.BLLGetBuild();
            ddlBuild.DataSource = attributes;
            ddlBuild.DataTextField = BUILD_COLUMN;
            ddlBuild.DataBind();

            attributes = m.BLLGetEyeColor();
            ddlEyeColor.DataSource = attributes;
            ddlEyeColor.DataTextField = EYE_COLOR_COLUMN;
            ddlEyeColor.DataBind();

            attributes = m.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataTextField = GENDER_COLUMN;
            ddlGender.DataBind();

            attributes = m.BLLGetHairColor();
            ddlHairColor.DataSource = attributes;
            ddlHairColor.DataTextField = HAIR_COLOR_COLUMN;
            ddlHairColor.DataBind();

            attributes = m.BLLGetHeight();
            ddlHeight.DataSource = attributes;
            ddlHeight.DataTextField = HEIGHT_COLUMN;
            ddlHeight.DataBind();

            attributes = m.BLLGetHobbies();
            rblHobbies.DataSource = attributes;
            rblHobbies.DataTextField = HOBBIES_COLUMN;
            rblHobbies.DataBind();

            attributes = m.BLLGetSexualOrientation();
            ddlSexualOrientation.DataSource = attributes;
            ddlSexualOrientation.DataTextField = SEXUAL_ORIENTATION_COLUMN;
            ddlSexualOrientation.DataBind();
        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {

        }
    }
}