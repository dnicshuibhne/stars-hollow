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
using ResourceTier;

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
            /* check if logged in*/
            user = (UserModel)Session[Resources.USER_SESSION_STATE];
            if (user == null || user.ID < 1)
            {
                //Response.Redirect("Default.aspx", true);
            }

            user = new UserModel();
            user.ID = 1;
            messageManager = new BLLMessageMngr(user.ID);
            getMessages();
        }
        
        private void getMessages()
        {
            rptConversations.DataSource = messageManager.getMessagesTest(1);
            rptConversations.DataBind();
            //GridView1.DataSource = messageManager.getMessagesTest(1);
            //GridView1.DataBind();
        }

        private void getConversation(int user2ID)
        {
            //rptconvoMessages.DataSource = messageManager.getConversation(user2ID);
            //rptconvoMessages.DataBind();
            myMessage.Visible = true;
            myConversations.Visible = false;
        }

        public void getCssClass(int senderID, int receiverID)
        {
            if (user.ID.Equals(senderID))
                Response.Write(sentCss);
            else if (user.ID.Equals(receiverID))
                Response.Write(receivedCss);
        }
        
        protected void viewThisMessage(string senderID, string receiverID)
        {
            int sent = int.Parse(senderID);
            int received = int.Parse(receiverID);
            if(user.ID.Equals(sent))
                getConversation(received);
            else if(user.ID.Equals(received))
                getConversation(sent);
        }

        protected void viewThisMessage_Click(object sender, EventArgs e)
        {
            Control c = (Control)sender;

        }

        protected void rptConversations_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            RepeaterItem item = (RepeaterItem)source;
            string s = item.DataItem.ToString();
            item.Visible = false;
        }

        protected void closeThisMessage_Click(object sender, EventArgs e)
        {
            myMessage.Visible = false;
            myConversations.Visible = true;
        }

        protected void RepeaterItemCreated(object sender, RepeaterItemEventArgs e)
        {
            Label l = e.Item.FindControl("lblSr") as Label;
            if (l != null)
                l.Text = e.Item.ItemIndex + 1 + "";
        }

        ///////////////////////////

        public string getUsername2(string senderName, string receiverName)
        {
            if (user.Username.Equals(senderName))
                return receiverName;
            else if (user.ID.Equals(receiverName))
                return senderName;
            else
                return "Unidentified Sender";
        }

        protected void setSenderLabel(object sender, string senderName, string receiverName)
        {
            Label l = (Label)sender;
            l.Text = getUsername2(senderName, "StarsHollow");
        }

        protected void btnInsertCommand_Click(object sender, EventArgs e)
        {
            messageManager.InsertIntoConvoTable();
        }
    }
}