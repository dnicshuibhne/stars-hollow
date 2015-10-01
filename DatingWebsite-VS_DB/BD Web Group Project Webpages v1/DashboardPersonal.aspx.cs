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
        BLLAttributeMngr attManager;
        BLLUserMngr userManager;
        UserModel user;
        List<string> attributes;
        DataTable hobbies;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
            userManager = new BLLUserMngr();
            user = userManager.BLLGetCurrentUser(Session);
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }
            if (!IsPostBack)
            {
                /*Retrieve and load the values of each attribute*/
                attManager = new BLLAttributeMngr();
                hobbies = attManager.BLLGetHobbiesTable();

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

                attributes = attManager.BLLGetRelationshipStatus();
                ddlRelationshipStatus.DataSource = attributes;
                ddlRelationshipStatus.DataBind();

                attributes = attManager.BLLGetSexualOrientation();
                ddlOrientation.DataSource = attributes;
                ddlOrientation.DataBind();

                cblHobbies.DataSource = hobbies;
                cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
                cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
                cblHobbies.DataBind();

                if (user != null)
                {
                    if (user.Age != null && user.Age > 0) txtAge.Text = user.Age.ToString();
                    if (user.IdealDate!=null && user.IdealDate.Length > 0) txtIdealDate.Text = user.IdealDate;
                    if (user.Profession != null && user.Profession.Length > 0) txtProfession.Text = user.Profession;
                    if (user.Town != null && user.Town.Length > 0) txtTown.Text = user.Town;
                    if (user.Comments != null && user.Comments.Length > 0) txtComments.Text = user.Comments;

                    if (user.Build != null && user.Build.Length > 0) ddlBuild.Items.FindByValue(user.Build).Selected = true;
                    if (user.County != null && user.County.Length > 0) ddlCounty.Items.FindByValue(user.County).Selected = true;
                    if (user.Ethnicity != null && user.Ethnicity.Length > 0) ddlEthnicity.Items.FindByValue(user.Ethnicity).Selected = true;
                    if (user.EyeColor != null && user.EyeColor.Length > 0) ddlEyeColor.Items.FindByValue(user.EyeColor).Selected = true;
                    if (user.Gender != null && user.Gender.Length > 0) ddlGender.Items.FindByValue(user.Gender).Selected = true;
                    if (user.HairColor != null && user.HairColor.Length > 0) ddlHairColor.Items.FindByValue(user.HairColor).Selected = true;
                    if (user.Height != null && user.Height.Length > 0) ddlHeight.Items.FindByValue(user.Height).Selected = true;
                    if (user.RelationshipStatus != null && user.RelationshipStatus.Length > 0) ddlRelationshipStatus.Items.FindByValue(user.RelationshipStatus).Selected = true;
                    if (user.SexualOrientation != null && user.SexualOrientation.Length > 0) ddlOrientation.Items.FindByValue(user.SexualOrientation).Selected = true;
                    
                    // Populate the CheckBoxList items only when it's not a postback.
                    foreach (int i in user.Hobbies)
                    {
                        cblHobbies.Items[i].Selected = true;
                    }
                }
            }
        }

        protected void btnUpdateDetails_Click(object sender, EventArgs e)
        {
            if (txtAge.Text.Length > 0) user.Age = int.Parse(txtAge.Text);
            if (ddlBuild.SelectedValue.Length > 0) user.Build = ddlBuild.SelectedValue;
            if (ddlCounty.SelectedValue.Length > 0) user.County = ddlCounty.SelectedValue;
            if (txtComments.Text.Length > 0) user.Comments = txtComments.Text;
            if (ddlEthnicity.SelectedValue.Length > 0) user.Ethnicity = ddlEthnicity.SelectedValue;
            if (ddlEyeColor.SelectedValue.Length > 0) user.EyeColor = ddlEyeColor.SelectedValue;
            if (ddlGender.SelectedValue.Length > 0) user.Gender = ddlGender.SelectedValue;
            if (ddlHairColor.SelectedValue.Length > 0) user.HairColor = ddlHairColor.SelectedValue;
            if (ddlHeight.SelectedValue.Length > 0) user.Height = ddlHeight.SelectedValue;
            if (txtIdealDate.Text.Length > 0) user.IdealDate = txtIdealDate.Text;
            if (txtProfession.Text.Length > 0) user.Profession = txtProfession.Text;
            if (ddlRelationshipStatus.SelectedValue.Length > 0) user.RelationshipStatus = ddlRelationshipStatus.SelectedValue;
            if (ddlOrientation.SelectedValue.Length > 0) user.SexualOrientation = ddlOrientation.SelectedValue;
            if (txtTown.Text.Length > 0) user.Town = txtTown.Text;

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
            userManager.BLLUpdateUser(user);
        }

        //protected void cblHobbies_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string hobbyString;
        //    int hobbyID;
        //    //get hobbies
        //    foreach (ListItem hobby in cblHobbies.Items)
        //    {
        //        if (hobby.Selected)
        //        {
        //            hobbyString = hobby.Text;
        //            hobbyID = int.Parse(hobby.Value);
        //            user.Hobbies.Add(hobbyID);
        //        }
        //    }
        //}
    }
}