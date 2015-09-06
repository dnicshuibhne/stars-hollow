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
    public partial class RegistrationV2 : System.Web.UI.Page
    {
        /* This method retrieves any attributes and adds them to the page in the from of drop down lists*/
        protected void Page_Load(object sender, EventArgs e)
        {
            //DropDownList ddl;
            //BLLAttributeMngr attributeManager;
            //attributeManager = new BLLAttributeMngr();

            //Dictionary<string, List<string>> attributes = attributeManager.BLLGetAllAttributes();

            //foreach (KeyValuePair<string, List<string>> kvp in attributes)
            //{
            //    ddl = new DropDownList();
            //    ddl.DataSource = kvp.Value;
            //    ddl.DataTextField = kvp.Key;
            //    ddl.DataBind();
            //    regDiv.Controls.Add(ddl);
            //}
        }
    }
}