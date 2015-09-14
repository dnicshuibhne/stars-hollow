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

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class MyMessages : System.Web.UI.Page
    {
        BLLMessageMngr messageManager;
        UserModel user;
        string sentCss = "myMessage";
        string receivedCss = "theirMessage";

        protected void Page_Load(object sender, EventArgs e)
        {
            int userID = 1; //get from session
            user = new UserModel(userID, "username", "password");// get from seesion or DB
            //messageManager = new BLLMessageMngr(user.ID);
            //getMessages();
        }
        
        private void getMessages()
        {
            //rptConversations.DataSource = messageManager.getAllMessages();
           // rptConversations.DataBind();
        }

        private void getConversation(int user2ID)
        {
            rptconvoMessages.DataSource = messageManager.getConversation(user2ID);
            rptconvoMessages.DataBind();
        }

        public void getCssClass(int senderID, int receiverID)
        {
            if (user.ID.Equals(senderID))
                Response.Write(sentCss);
            else if (user.ID.Equals(receiverID))
                Response.Write(receivedCss);
        }

        public string getUsername2(string senderName, string receiverName)
        {
            if (user.Username.Equals(senderName))
                return receiverName;
            else if (user.ID.Equals(receiverName))
                return senderName;
            else
                return "Unidentified Sender";

            
        }
    }
}