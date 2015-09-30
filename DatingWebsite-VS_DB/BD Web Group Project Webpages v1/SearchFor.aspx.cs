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
        BLLAttributeMngr attributeManager;
        List<string> attributes;



        public string AgeRange { get { return ddlAgeRange.SelectedValue; } }
        public string Build { get { return ddlBuild.SelectedValue; } }
        public string County { get { return ddlCounty.SelectedValue; } }
        public string Gender { get { return ddlGender.SelectedValue; } }
        public string Height { get { return ddlHeight.SelectedValue; } }
        public string Profession { get { return txtProfession.Text; } }
        public string RelationshipStatus { get { return ddlRelationshipStatus.SelectedValue; } }
        public string SexualOrientation { get { return ddlOrientation.SelectedValue; } }
        public string Town { get { return txtTown.Text; } }
        public List<int> Hobbies
        {
            get
            {
                List<int> hobbies = new List<int>();
                foreach (ListItem item in cblHobbies.Items)
                {
                    if (item.Selected)
                        hobbies.Add(int.Parse(item.Value));
                }
                return hobbies;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                attributeManager = new BLLAttributeMngr();

                if (!IsPostBack)
                {
                    getAttributes();
                }
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx");
            }
        }

        private void getAttributes()
        {
            try
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

                attributes = attributeManager.BLLGetGenders();
                ddlGender.DataSource = attributes;
                ddlGender.DataBind();

                attributes = attributeManager.BLLGetHeight();
                ddlHeight.DataSource = attributes;
                ddlHeight.DataBind();

                attributes = attributeManager.BLLGetRelationshipStatus();
                ddlRelationshipStatus.DataSource = attributes;
                ddlRelationshipStatus.DataBind();

                attributes = attributeManager.BLLGetSexualOrientation();
                ddlOrientation.DataSource = attributes;
                ddlOrientation.DataBind();

                cblHobbies.DataSource = attributeManager.BLLGetHobbiesTable();
                cblHobbies.DataValueField = Resources.HOBBIES_ID_COLUMN;
                cblHobbies.DataTextField = Resources.HOBBIES_NAME_COLUMN;
                cblHobbies.DataBind();
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx");
            }
        }
    }
}