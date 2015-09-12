using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using System.Data;
using DataModels;

namespace WebApplication1
{
    public partial class AttributeForm : System.Web.UI.Page
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

        /* Generate page data */
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Retrieve and load the values of each attribute*/
            attManager = new BLLAttributeMngr();

            attributes = attManager.BLLGetAgeRange();
            ddlAgeRange.DataSource = attributes;
            ddlAgeRange.DataTextField = AGE_RANGE_COLUMN;
            ddlAgeRange.DataBind();

            attributes = attManager.BLLGetBuild();
            ddlBuild.DataSource = attributes;
            ddlBuild.DataTextField = BUILD_COLUMN;
            ddlBuild.DataBind();

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

            attributes = attManager.BLLGetHeight();
            ddlHeight.DataSource = attributes;
            ddlHeight.DataTextField = HEIGHT_COLUMN;
            ddlHeight.DataBind();

            attributes = attManager.BLLGetHobbies();
            cblHobbies.DataSource = attributes;
            cblHobbies.DataValueField = HOBBIES_ID_COLUMN;
            cblHobbies.DataTextField = HOBBIES_NAME_COLUMN;
            cblHobbies.DataBind();

            attributes = attManager.BLLGetSexualOrientation();
            ddlSexualOrientation.DataSource = attributes;
            ddlSexualOrientation.DataTextField = SEXUAL_ORIENTATION_COLUMN;
            ddlSexualOrientation.DataBind();
        }

        /* Add user details */
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ageRange, build, eyeColor, gender, hairColor, height, sexualOrientation;
            List<int> hobbies = new List<int>();

            ageRange = ddlAgeRange.SelectedValue;
            build = ddlBuild.SelectedValue;
            eyeColor = ddlEyeColor.SelectedValue;
            gender = ddlGender.SelectedValue;
            hairColor = ddlHairColor.SelectedValue;
            height = ddlHeight.SelectedValue;
            sexualOrientation = ddlSexualOrientation.SelectedValue;

            foreach (ListItem hobby in cblHobbies.Items)
            {
                if (hobby.Selected)
                {
                    hobbies.Add(int.Parse(hobby.Text));
                }
            }

            //regForm.Visible = false;
            Response.Write(ageRange + "<br />");
            Response.Write(build + "<br />");
            Response.Write(eyeColor + "<br />");
            Response.Write(gender + "<br />");
            Response.Write(hairColor + "<br />");
            Response.Write(height + "<br />");
            Response.Write(sexualOrientation + "<br />");
        }
    }
}