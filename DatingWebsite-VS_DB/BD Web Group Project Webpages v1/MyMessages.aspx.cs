using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using System.Data;
using System.Linq;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class MyMessages : System.Web.UI.Page
    {
        BLLMessageMngr messageManager;
        int userID = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            messageManager = new BLLMessageMngr();
            getConversations();
        }
        
        private void getConversations()
        {
            rptConversations.DataSource = messageManager.getMessages(userID);
            rptConversations.DataBind();
        }

        private void getConversation(int senderID)
        {
            //rptconvoMessages.DataSource = messageManager.getConversation(userID, senderID);
            rptconvoMessages.DataBind();
        }

        //private void Test()
        //{
        //    DataSet data = messageManager.getMessages(userID);
        //    DataTable messages = data.Tables[0];
            

        //    var expensiveInStockProducts =
        //        from p in messages
        //        where p.UnitsInStock > 0 && p.UnitPrice > 3.00M
        //        select p;

        //    Console.WriteLine("In-stock products that cost more than 3.00:");
        //    foreach (var product in expensiveInStockProducts)
        //    {
        //        Console.WriteLine("{0} is in stock and costs more than 3.00.", product.ProductName);
        //    } 
        //}
    }
}