using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Configuration;
using System.Data;
using DataModels;
using System.Data.SqlClient;
using System.Xml;
using ResourceTier;

namespace DAL
{
    public class DALMessageMngr
    {
        private const string CS_NAME = "DatingDB";

        private string conString;

        public DALMessageMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        public List<Conversation> getSentAndReceivedMessages(int userID)
        {
            return getMessages(userID, Resources.GET_MESSAGES_PROC);
        }

        public List<Conversation> getMessages(int userID, string procname)
        {
            DataSet data = new DataSet();
            List<Conversation> convoList = new List<Conversation>();
            
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd= new SqlCommand(procname, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Conversation convo = new Conversation();

                            convo.ConversationID = reader.GetValue(Convert.ToInt32(0)).ToString()
                        }
                    }
                    
                    con.Close();
                }
            }

            return convoList;
        }


        public DataTable getMessagesTest(int userID)
        {
            DataSet data = new DataSet();
            string sql = "Select * from Messages Where SenderID=\'"+userID+"\'";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(sql, con);
                    adapter.SelectCommand.CommandType = CommandType.Text;

                    con.Open();

                    int rowsAffected = adapter.Fill(data);

                    if (rowsAffected < 1)
                    {
                        throw new Exception("Error Retrieving Messages");
                    }

                    con.Close();
                }
            }

            return data.Tables[0];
        }

        public void InsertIntoConvoTable()
        {
            string query = @"INSERT INTO Conversation
                            VALUES
                            (
                                ParticipantA_ID = 9,
                                ParticipantA_ID = 1,
                                MessageContent = 
                                <conversation>
	                                <message>
		                                <senderID>9</senderID>
		                                <senderName>aoconnor</senderName>
		                                <timestamp>01/01/2015 00:00:00</timestamp>
		                                <content>Hi, how are you?</content>
	                                </message>
	                                <message>
		                                <senderID>1</senderID>
		                                <senderName>Sarah</senderName>
		                                <timestamp>01/01/2015 00:05:00</timestamp>
		                                <content>I'm good. Yourself?</content>
	                                </message>
	                                <message>
		                                <senderID>9</senderID>
		                                <senderName>aoconnor</senderName>
		                                <timestamp>01/01/2015 00:14:00</timestamp>
		                                <content>Happy enouhg</content>
	                                </message>
	                                <message>
		                                <senderID>9</senderID>
		                                <senderName>aoconnor</senderName>
		                                <timestamp>01/01/2015 00:22:00</timestamp>
		                                <content>*enough</content>
	                                </message>
                                </conversation>,
                            )";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected < 1)
                    {
                        throw new Exception("Error Inserting Data");
                    }

                    con.Close();
                }
            }
        }

        //public DataTable getReceivedMessages(int receiverID)
        //{
        //    return getMessages(receiverID, "receivedMessagesProc");
        //}

        //public DataTable getSentMessages(int senderID)
        //{
        //    return getMessages(senderID, "sentMessagesProc");
        //}

        //private void XmlTest()
        //{
        //    SqlDataReader reader;
        //    int ID = 15;
        //    string proc = "getReceivedMessages";
        //    string receiverIDParam = "@receiverID";


        //    SqlConnection con = new SqlConnection(conString);

        //    using (SqlCommand cmd = new SqlCommand(proc, con))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add(receiverIDParam, SqlDbType.Int).Value = ID;
        //        DataTable table = new DataTable();
        //        table.Columns.Add(MESSAGE_ID_STR);
        //        table.Columns.Add(SENDER_ID_STR);
        //        table.Columns.Add(RECEIVER_ID_STR);
        //        table.Columns.Add(TIMESTAMP_STR);
        //        table.Columns.Add(CONTENT);

        //        using (con)
        //        {
        //            con.Open();
        //            reader = cmd.ExecuteReader();
        //            while (reader.Read())
        //            {
        //                string xml = reader["message"].ToString();
        //                XmlDocument xDoc = new XmlDocument();
        //                xDoc.LoadXml(xml);
        //                XmlNodeList list = xDoc.SelectNodes("/modules/module");
        //                foreach (XmlNode node in list)
        //                {
        //                    DataRow dataRow = table.NewRow();
        //                    dataRow[MESSAGE_ID_STR] = node.SelectSingleNode("message_id").InnerText;
        //                    dataRow[SENDER_ID_STR] = node.SelectSingleNode("sender_id").InnerText;
        //                    dataRow[RECEIVER_ID_STR] = node.SelectSingleNode("reciever_id").InnerText;
        //                    dataRow[TIMESTAMP_STR] = node.SelectSingleNode("timestamp").InnerText;
        //                    dataRow[CONTENT] = node.SelectSingleNode("content").InnerText;
        //                    table.Rows.Add(dataRow);
        //                }
        //            }

        //        }
        //    }

        //}
        //
    }
}
