using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Xml;

namespace DataModels
{
    public class Conversation
    {
        public int ConversationID { get; set; }
        public int ParticipantA_ID { get; set; }
        public string  ParticipantA_Name { get; set; }
        public int ParticipantB_ID { get; set; }
        public string ParticipantB_Name { get; set; }
        public List<Message> MessagesList { get; set; }

        public Conversation()
        {
            MessagesList = new List<Message>();
        }

        public void ConvertXMLToList(XmlDocument xDoc)
        {
            XmlNodeList list = xDoc.SelectNodes("/Conversation/Message");
            foreach (XmlNode node in list)
            {
                Message msg = new Message();

                msg.SenderID = Convert.ToInt32(node.SelectSingleNode("SenderID").InnerText);
                msg.Timestamp= Convert.ToDateTime(node.SelectSingleNode("TimeStamp").InnerText);
                msg.Content = node.SelectSingleNode("Content").InnerText;

                MessagesList.Add(msg);
            }
        }
    }
}
