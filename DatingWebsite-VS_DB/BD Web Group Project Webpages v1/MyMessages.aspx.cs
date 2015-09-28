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
            // Retreive full list of Conversations
            List<Conversation> conversationList = messageManager.getMessagesTest(1);

            List<ConversationSummary> summaryList = new List<ConversationSummary>();

            foreach(Conversation convo in conversationList)
            {
                ConversationSummary newSummary = new ConversationSummary();
                int index = convo.MessagesList.Count - 1;
                
                // Ensure the messages in this conversation are chronologically ordered
                convo.MessagesList = (from c in convo.MessagesList
                                      orderby c.Timestamp ascending
                                      select new Message()
                                      {
                                          SenderID = c.SenderID,
                                          Timestamp = c.Timestamp,
                                          Content = c.Content
                                      }).ToList();

                // Assign last message in this conversation that does not belong to the logged in user 
                // to summary's values
                newSummary.ConversationID = convo.ConversationID;

                while(string.IsNullOrEmpty(newSummary.LastMessage))
                {
                    if (convo.MessagesList[index].SenderID != user.ID)
                    {
                        newSummary.LastMessage = convo.MessagesList[index].Content;
                        
                    }
                    else if(convo.MessagesList.Count == 1)
                    {
                        if (convo.MessagesList[index].SenderID == user.ID)
                        {
                            newSummary.LastMessage = ">>" + convo.MessagesList[index].Content;
                        }
                    }
                    else
                    {
                        index--;
                    }
                }
                newSummary.OtherPersonName = convo.ParticipantA_Name != user.Username ? convo.ParticipantA_Name : convo.ParticipantB_Name;
                summaryList.Add(newSummary);
            }

            // Allocate List to repeater datasource.
            rptConversations.DataSource = summaryList;
            rptConversations.DataBind();
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

        // Helper method for filling data into the Conversation table

        protected void btnInsertCommand_Click(object sender, EventArgs e)
        {
            Conversation newConvo = new Conversation();

            newConvo.ParticipantA_ID = 20;
            newConvo.ParticipantB_ID = 1;

            Message msg1 = new Message();
            msg1.SenderID = 20;
            msg1.Timestamp = DateTime.Now;
            msg1.Content = "Hello is this Hugo?";

            Message msg2 = new Message();
            msg2.SenderID = 20;
            msg2.Timestamp = DateTime.Now;
            msg2.Content = "Hugo? Hello Hugo?.";
            
            Message msg3 = new Message();
            msg3.SenderID = 1;
            msg3.Timestamp = DateTime.Now;
            msg3.Content = "I'm not Hugo";

            Message msg4 = new Message();
            msg4.SenderID = 20;
            msg4.Timestamp = DateTime.Now;
            msg4.Content = "Oh sorry Hugo";

            newConvo.MessagesList.Add(msg1);
            newConvo.MessagesList.Add(msg2);
            newConvo.MessagesList.Add(msg3);
            newConvo.MessagesList.Add(msg4);

            messageManager.InsertIntoConvoTable(newConvo);
        }
    }
}