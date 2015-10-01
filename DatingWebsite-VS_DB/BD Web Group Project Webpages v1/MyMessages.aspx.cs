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
        BLLUserMngr userManager;
        UserModel user;
        string sentCss = "myMessage";
        string receivedCss = "theirMessage";
        static List<Conversation> conversationList;
        static Conversation selectedConversation;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Instantiate selectedConversation, if required.
                if (selectedConversation == null)
                {
                    selectedConversation = new Conversation();
                }

                // Check if query string contains ConversationID value
                String selectedConvoID = Request.ServerVariables["QUERY_STRING"];

                if (selectedConvoID.Length > 0)
                {
                    /* If a conversation was selected, retreive the selected conversation 
                     * according to its ID in conversation<List> and present its messages to the user.
                     * */
                    int selectedIDasInt;
                    if (int.TryParse(selectedConvoID, out selectedIDasInt))
                    {
                        for (int i = 0; i < conversationList.Count; i++)
                        {
                            if (conversationList.ElementAt(i).ConversationID.Equals(selectedIDasInt))
                            {
                                selectedConversation = conversationList.ElementAt(i);
                                break;
                            }
                        }

                        mySummaries.Visible = false;
                        MessageThread.Visible = true;
                        PopulateMessageThread(selectedConversation);
                    }
                }

                userManager = new BLLUserMngr();
                user = userManager.BLLGetCurrentUser(Session);

                messageManager = new BLLMessageMngr(user.ID);
                getMessages();
            }
            catch (Exception)
            {
                //throw;
            }
        }
        
        private void getMessages()
        {
            try
            {
                // Retreive full list of Conversations
                conversationList = messageManager.getMessagesTest(1);

                List<ConversationSummary> summaryList = new List<ConversationSummary>();

                foreach (Conversation convo in conversationList)
                {
                    ConversationSummary newSummary = new ConversationSummary();
                    int lastIndex = convo.MessagesList.Count - 1;

                    // Ensure the messages in this conversation are chronologically ordered
                    convo.MessagesList = (from c in convo.MessagesList
                                          orderby c.Timestamp ascending
                                          select new Message()
                                          {
                                              SenderID = c.SenderID,
                                              Timestamp = c.Timestamp,
                                              Content = c.Content
                                          }).ToList();

                    /* Assign last message in this conversation that does not belong to the logged in user 
                     * to summary's values
                     * */
                    newSummary.ConversationID = convo.ConversationID;

                    if (convo.MessagesList[lastIndex].SenderID == user.ID)
                    {
                        newSummary.LastMessage = ">> " + convo.MessagesList[lastIndex].Content;
                    }
                    else
                    {
                        newSummary.LastMessage = convo.MessagesList[lastIndex].Content;
                    }
                    
                    newSummary.OtherPersonName = convo.ParticipantA_Name != user.Username ? convo.ParticipantA_Name : convo.ParticipantB_Name;
                    summaryList.Add(newSummary);
                }

                // Allocate List to repeater datasource.
                rptSummaries.DataSource = summaryList;
                rptSummaries.DataBind();
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Error loading messages from database.')", true);
                throw;
            }
        }

        protected void closeThisMessage_Click1(object sender, EventArgs e)
        {
            MessageThread.Visible = false;
            mySummaries.Visible = true;
            selectedConversation = null;
        }

        private void PopulateMessageThread(Conversation convo)
        {
            /* This fills rptconvoMessages with all the messages in selectedConvo
             * and assigns CSS classes according to the message's sender.
             * */
            rptconvoMessages.DataSource = convo.MessagesList;
            rptconvoMessages.DataBind();
        }

        public string getCssClass(int senderID)
        {
            if (user == null)
            {
                userManager = new BLLUserMngr();
                user = userManager.BLLGetCurrentUser(Session);
            }

            if (user.ID.Equals(senderID))
                return sentCss;
            else 
                return receivedCss;
        }

        protected void imgBtnSendMessage_Click(object sender, ImageClickEventArgs e)
        {
            /*
             * This button does three things:
             *  1. It saves the latest message to selectedConvo.MessageList.
             *  2. It sends the entire conversation to the database to be refreshed and then stored.
             *  3. It refreshes the repeater.
             *  
             * The second point seems excessive as there will therefore be a database call every time
             * a message is sent. But for users who expect to be able to message one another, 
             * a narrow frame of time between messages being sent and received, 
             * and therefore stored in the database and fetched, is essential.
             * */

            try
            {
                // Point 1.
                Message newMessage = new Message();
                newMessage.SenderID = user.ID;
                newMessage.Timestamp = DateTime.Now;
                newMessage.Content = txtNewMessage.Text;

                selectedConversation.MessagesList.Add(newMessage);

                // Point 2.
                selectedConversation = messageManager.UpdateConvoTable(selectedConversation);

                // Point 3.
                PopulateMessageThread(selectedConversation);

                txtNewMessage.Text = "";
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Error sending message. Message not delivered.')", true);
                throw;
            }
        }


        // Helper method for filling dummy data into the Conversation table
        protected void btnInsertCommand_Click(object sender, EventArgs e)
        {
            Conversation newConvo = new Conversation();

            newConvo.ParticipantA_ID = 12;
            newConvo.ParticipantB_ID = 1;

            Message msg1 = new Message();
            msg1.SenderID = 12;
            msg1.Timestamp = DateTime.Now;
            msg1.Content = "How did you get on on Saturday";

            Message msg2 = new Message();
            msg2.SenderID = 1;
            msg2.Timestamp = DateTime.Now;
            msg2.Content = "What was on Saturday?";
            
            Message msg3 = new Message();
            msg3.SenderID = 1;
            msg3.Timestamp = DateTime.Now;
            msg3.Content = "Wait, oh the cinema. Yeah it was nice. Good movie, highly recommended.";

            Message msg4 = new Message();
            msg4.SenderID = 12;
            msg4.Timestamp = DateTime.Now;
            msg4.Content = "Which film was it again?";

            newConvo.MessagesList.Add(msg1);
            newConvo.MessagesList.Add(msg2);
            newConvo.MessagesList.Add(msg3);
            newConvo.MessagesList.Add(msg4);

            messageManager.InsertIntoConvoTable(newConvo);
        }
    }
}