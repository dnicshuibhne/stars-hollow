using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using System.Data;
using ResourceTier;
using DataModels;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class DashboardPersonal : System.Web.UI.Page
    {
        // Attribute column names

        BLLAttributeMngr attManager;
        BLLUserMngr userManager;
        //DataTable attributes;
        List<string> attributes;
        DataTable hobbies;
        int userid = 1;//TEST

        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookie = Response.Cookies.Get(Resources.USER_COOKIE);
            UserModel user;
            //if (cookie == null)
            //{
            //    Response.Redirect("Default.aspx", true);
            //}
            //string c = cookie.Value;
            //int i = int.Parse(c);
            //if (i > 0)
            //{
            //    Response.Redirect("Default.aspx", true);
            //}
            //else
            //{
                 /*Retrieve and load the values of each attribute*/
                attManager = new BLLAttributeMngr();
                userManager = new BLLUserMngr();
            //    user = userManager.getUser(int.Parse(cookie["ID"]));
                hobbies = attManager.BLLGetHobbies();

                user = userManager.getUser(userid);

                txtAge.Text = user.Age.ToString();
                txtIdealDate.Text = user.IdealDate;
                txtProfession.Text = user.Profession;
                txtTown.Text = user.Town;
                //txtComment.Text = user.Comment;


                attributes = attManager.BLLGetBuild();
                ddlBuild.DataSource = attributes;
                ddlBuild.DataBind();
                ddlBuild.Items.FindByValue(user.Build).Selected = true;

                attributes = attManager.BLLGetCounty();
                ddlCounty.DataSource = attributes;
                //ddlCounty.DataTextField = Resources.COUNTY_TABLE;
                ddlCounty.DataBind();
                ddlCounty.Items.FindByValue(user.County).Selected = true;

                attributes = attManager.BLLGetEthnicity();
                ddlEthnicity.DataSource = attributes;
                //ddlEthnicity.DataTextField = Resources.ETHNICITY_TABLE;
                ddlEthnicity.DataBind();
                ddlEthnicity.Items.FindByValue(user.Ethnicity).Selected = true;

                attributes = attManager.BLLGetEyeColor();
                ddlEyeColor.DataSource = attributes;
                //ddlEyeColor.DataTextField = Resources.EYE_COLOR_TABLE;
                ddlEyeColor.DataBind();
                ddlEyeColor.Items.FindByValue(user.EyeColor).Selected = true;

                attributes = attManager.BLLGetGenders();
                ddlGender.DataSource = attributes;
                //ddlGender.DataTextField = Resources.GENDER_TABLE;
                ddlGender.DataBind();
                ddlGender.Items.FindByValue(user.Gender).Selected = true;

                attributes = attManager.BLLGetHairColor();
                ddlHairColor.DataSource = attributes;
                //ddlHairColor.DataTextField = Resources.HAIR_COLOR_TABLE;
                ddlHairColor.DataBind();
                ddlHairColor.Items.FindByValue(user.HairColor).Selected = true;

                attributes = attManager.BLLGetHeight();
                ddlHeight.DataSource = attributes;
                ddlHeight.DataBind();
                ddlHeight.Items.FindByValue(user.Height).Selected = true;

                attributes = attManager.BLLGetRelationshipStatus();
                ddlRelationshipStatus.DataSource = attributes;
                //ddlRelationshipStatus.DataTextField = Resources.RELATIONSHIP_STATUS_TABLE;
                ddlRelationshipStatus.DataBind();
                ddlRelationshipStatus.Items.FindByValue(user.RelationshipStatus).Selected = true;

                attributes = attManager.BLLGetSexualOrientation();
                ddlOrientation.DataSource = attributes;
                //ddlOrientation.DataTextField = Resources.SEXUAL_ORIENTATION_TABLE;
                ddlOrientation.DataBind();
                ddlOrientation.Items.FindByValue(user.SexualOrientation).Selected = true;

                cblHobbies.DataSource = hobbies;
                cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
                cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
                cblHobbies.DataBind();
                foreach (int i in user.Hobbies)
                {
                    cblHobbies.Items[i].Selected = true;
                }
           
        }

        protected void btnUpdateDetails_Click(object sender, EventArgs e)
        {
            UserModel user = new UserModel();
            user.Age = int.Parse(txtAge.Text);
            user.Build = ddlBuild.SelectedValue;
            user.County = ddlCounty.SelectedValue;
            user.Ethnicity = ddlEthnicity.SelectedValue;
            user.EyeColor = ddlEyeColor.SelectedValue;
            user.Gender = ddlGender.SelectedValue;
            user.HairColor = ddlHairColor.SelectedValue;
            user.Height = ddlBuild.SelectedValue;
            user.IdealDate = txtIdealDate.Text;
            user.Profession = txtProfession.Text;
            user.RelationshipStatus = ddlRelationshipStatus.SelectedValue;
            user.SexualOrientation = ddlOrientation.SelectedValue;
            user.Town = txtTown.Text;
            
            //get hobbies
            foreach (ListItem hobby in cblHobbies.Items)
            {
                if (hobby.Selected)
                {
                    user.Hobbies.Add(int.Parse(hobby.Text));
                }
            }
            userManager.updateUser(user);
        }
    }
}