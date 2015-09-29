using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using DataModels;
using ResourceTier;
using BLL;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class ViewMatchProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.ServerVariables["QUERY_STRING"];
            if (username.Length > 0)
            {
                BLLUserMngr userManager = new BLLUserMngr();
                UserModel user = userManager.BLLGetUser(username);
                lblUsername.Text = username;
                imgProfilePicture.ImageUrl = user.ProfilePicturePath;
                lblUserDescription.Text = (user.Comments != null && user.Comments.Length > 0) ? user.Comments : "Guess I have nothing to say!";
                lblUserCounty.Text = user.County;
                lblUserProfesssion.Text = user.Profession;
                lblUserGender.Text = user.Gender;
                lblUserOrientation.Text = user.SexualOrientation;
                lblUserEyeColor.Text = user.EyeColor;
                lblUserHairColor.Text = user.HairColor;
                lblUserAge.Text = user.Age.ToString();
                hobbyRepeater.DataSource = userManager.BLLGetHobbiesTable(user.ID);
                hobbyRepeater.DataBind();
            }
        }
    }
}