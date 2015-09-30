using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DAL;
using System.Data;
using DataModels;
using System.Reflection;

namespace BLL
{
    /*
     * This class contains methods for storing and retrieving messages sent and received by the user
     */
    public class BLLMessageMngr
    {
        private DALMessageMngr messageManager;
        private int userID;
        private List<Conversation> allMessages;
        private string orderNewToOld = "Timestamp DESC"; // newest to oldest
        private string orderOldToNew = "Timestamp ASC"; // oldest to newest

        public BLLMessageMngr()
        { }

        public BLLMessageMngr(int userID)
        {
            this.userID = userID;
            messageManager = new DALMessageMngr();    
        }

        public List<Conversation> getMessagesTest(int id)
        {
            //string filter = "true";//ReceiverID = '" + userID + "' OR SenderID = '" + userID + "'";
            //List<Conversation> convoList = DataTableToList<Conversation>(rows[0].Table);

            allMessages = messageManager.getSentAndReceivedMessages(userID);

            return allMessages;
        }

        public Conversation UpdateConvoTable(Conversation selectedConvo)
        {
            selectedConvo = messageManager.UpdateConvoTable(selectedConvo);
            return selectedConvo;
        }

        public bool AddNewConversation(Conversation newConvo)
        {
            bool isAddedSuccessfully = false;

            try
            {
                messageManager.AddNewConversation(newConvo);
            }
            catch (Exception)
            {
                throw;
            }

            return isAddedSuccessfully;
        }

        public void InsertIntoConvoTable(Conversation newConvo)
        {
            messageManager.InsertIntoConvoTable(newConvo);
        }
    }
}
