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
        private DataTable allMessages;
        private string orderNewToOld = "Timestamp DESC"; // newest to oldest
        private string orderOldToNew = "Timestamp ASC"; // oldest to newest

        public BLLMessageMngr(int userID)
        {
            this.userID = userID;
            messageManager = new DALMessageMngr();
            allMessages = messageManager.getSentAndReceivedMessages(userID);
        }
        public List<Conversation> getMessagesTest(int id)
        {
            string filter = "true";//ReceiverID = '" + userID + "' OR SenderID = '" + userID + "'";
            DataRow[] rows = allMessages.Select(filter, orderNewToOld);

            List<Conversation> convoList = DataTableToList<Conversation>(rows[0].Table);

            return convoList;
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


        // Helper method to convert DataTable to List<T>
        // Method written by Gaui http://codereview.stackexchange.com/a/56857

        public static List<T> DataTableToList<T>(DataTable table) where T : class, new()
        {
            try
            {
                List<T> list = new List<T>();

                foreach (var row in table.AsEnumerable())
                {
                    T obj = new T();

                    foreach (var prop in obj.GetType().GetProperties())
                    {
                        try
                        {
                            PropertyInfo propertyInfo = obj.GetType().GetProperty(prop.Name);
                            propertyInfo.SetValue(obj, Convert.ChangeType(row[prop.Name], propertyInfo.PropertyType), null);
                        }
                        catch
                        {
                            continue;
                        }
                    }

                    list.Add(obj);
                }

                return list;
            }
            catch
            {
                return null;
            }
        }

        public void InsertIntoConvoTable()
        {
            messageManager.InsertIntoConvoTable();
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
