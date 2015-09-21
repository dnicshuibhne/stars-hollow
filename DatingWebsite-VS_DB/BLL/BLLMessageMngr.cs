using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DAL;
using System.Data;
using DataModels;

namespace BLL
{
    /*
     * This class contains methods for storing and retrieving messages sent and received by the user
     */
    public class BLLMessageMngr
    {
        private DALMessageMngr messageManager;
        private int userID;
        private DataTable allMessages;
        List<Message> messageList;
        private string orderNewToOld = "Timestamp DESC"; // newest to oldest
        private string orderOldToNew = "Timestamp ASC"; // oldest to newest

        public BLLMessageMngr(int userID)
        {
            this.userID = userID;
            messageManager = new DALMessageMngr();
            messageList = messageManager.getSentAndReceivedMessages(userID);
            //allMessages = 
        }
        public List<Message> getMessagesTest(int id)
        {
            string filter = "true";//ReceiverID = '" + userID + "' OR SenderID = '" + userID + "'";
            DataTable table = new DataTable(); //filters and sorts results
            DataRow[] rows = allMessages.Select(filter, orderNewToOld);
            //foreach (DataRow row in rows)
            //{
            //    table.Rows.Add(null);
            //}

            messageList = messageManager.getSentAndReceivedMessages(id);
            return messageList;
        }

        public DataRow[] getAllMessages()
        {
            string filter = "true";//ReceiverID = '" + userID + "' OR SenderID = '" + userID + "'";
            return allMessages.Select(filter, orderNewToOld); //filters and sorts results
        }

        public DataRow[] getConversation(int user2ID)
        {
            string filter = "SenderID = '" + user2ID + "' OR ReceiverID = '" + user2ID + "'";
            return allMessages.Select(filter, orderOldToNew);//filters and sorts results
        }

        /* Unused functionality
         * 
        public DataRow[] getReceivedMessages()
        {
            string filter = "ReceiverID = '" + userID + "'";
            return allMessages.Select(filter, orderNewToOld);//filters and sorts results
        }

        public DataRow[] getSentMessages()
        {
            string filter = "SenderID = '" + userID + "'";
            return allMessages.Select(filter, orderNewToOld);//filters and sorts results
        }
         * 
         */
    }
}
