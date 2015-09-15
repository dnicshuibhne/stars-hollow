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
        List<string> attributes;
        UserModel user;
        DataTable hobbies;

        protected void Page_Load(object sender, EventArgs e)
        {
            /* check if logged in*/
            //user = (UserModel)Session[Resources.USER_SESSION_STATE];
            //if (user == null || user.ID < 1)
            //{
            //    Response.Redirect("Default.aspx", true);
            //}
            //else
            //{
                /*Retrieve and load the values of each attribute*/
                attManager = new BLLAttributeMngr();
                userManager = new BLLUserMngr();
                user = userManager.BLLGetUser(1);
                hobbies = attManager.BLLGetHobbies();

                txtAge.Text = user.Age.ToString();
                txtIdealDate.Text = user.IdealDate;
                txtProfession.Text = user.Profession;
                txtTown.Text = user.Town;
                //txtComment.Text = user.Comment;


                attributes = attManager.BLLGetBuild();
                ddlBuild.DataSource = attributes;
                ddlBuild.DataBind();

                attributes = attManager.BLLGetCounty();
                ddlCounty.DataSource = attributes;
                ddlCounty.DataBind();

                attributes = attManager.BLLGetEthnicity();
                ddlEthnicity.DataSource = attributes;
                ddlEthnicity.DataBind();

                attributes = attManager.BLLGetEyeColor();
                ddlEyeColor.DataSource = attributes;
                ddlEyeColor.DataBind();

                attributes = attManager.BLLGetGenders();
                ddlGender.DataSource = attributes;
                ddlGender.DataBind();

                attributes = attManager.BLLGetHairColor();
                ddlHairColor.DataSource = attributes;
                ddlHairColor.DataBind();

                attributes = attManager.BLLGetHeight();
                ddlHeight.DataSource = attributes;
                ddlHeight.DataBind();
                ddlHeight.Items.FindByValue(user.Height).Selected = true;

                attributes = attManager.BLLGetRelationshipStatus();
                ddlRelationshipStatus.DataSource = attributes;
                ddlRelationshipStatus.DataBind();

                attributes = attManager.BLLGetSexualOrientation();
                ddlOrientation.DataSource = attributes;
                ddlOrientation.DataBind();

                ddlBuild.Items.FindByValue(user.Build).Selected = true;
                ddlCounty.Items.FindByValue(user.County).Selected = true;
                ddlEthnicity.Items.FindByValue(user.Ethnicity).Selected = true;
                ddlEyeColor.Items.FindByValue(user.EyeColor).Selected = true;
                ddlGender.Items.FindByValue(user.Gender).Selected = true;
                ddlHairColor.Items.FindByValue(user.HairColor).Selected = true;
                ddlRelationshipStatus.Items.FindByValue(user.RelationshipStatus).Selected = true;
                ddlOrientation.Items.FindByValue(user.SexualOrientation).Selected = true;

                if (!IsPostBack)
                {

                cblHobbies.DataSource = hobbies;
                cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
                cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
                cblHobbies.DataBind();


                    // Populate the CheckBoxList items only when it's not a postback.
                    foreach (int i in user.Hobbies)
                    {
                        cblHobbies.Items[i].Selected = true;
                    }
                }
            }

        protected void btnUpdateDetails_Click(object sender, EventArgs e)
        {
            UserModel user = new UserModel();
            if (txtAge.Text.Length > 0) user.Age = int.Parse(txtAge.Text);
            user.Build = ddlBuild.SelectedValue;
            user.County = ddlCounty.SelectedValue;
            user.Ethnicity = ddlEthnicity.SelectedValue;
            user.EyeColor = ddlEyeColor.SelectedValue;
            user.Gender = ddlGender.SelectedValue;
            user.HairColor = ddlHairColor.SelectedValue;
            user.Height = ddlBuild.SelectedValue;
            if (txtIdealDate.Text.Length > 0) user.IdealDate = txtIdealDate.Text;
            if (txtProfession.Text.Length > 0) user.Profession = txtProfession.Text;
            user.RelationshipStatus = ddlRelationshipStatus.SelectedValue;
            user.SexualOrientation = ddlOrientation.SelectedValue;
            if (txtTown.Text.Length > 0) user.Town = txtTown.Text;
            
        }

        protected void cblHobbies_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hobbyString;
            int hobbyID;
            //get hobbies
            foreach (ListItem hobby in cblHobbies.Items)
            {
                if (hobby.Selected)
                {
                    hobbyString = hobby.Text;
                    hobbyID = int.Parse(hobby.Value);
                    user.Hobbies.Add(hobbyID);
                }
            }
        }
    }
}