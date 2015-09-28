using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModels
{
    public class ConversationSummary
    {
        // DataModel to represent the summary of the last message in a conversation thread
        // sent by the other participant.

        private string lastMessage { get; set; }

        public int ConversationID { get; set; }
        public string OtherPersonName { get; set; }
        public string LastMessage
        {
            get
            {
                return lastMessage;
            }
            set
            {
                if (!string.IsNullOrEmpty(value))
                {
                    if (value.Length > 50)
                    {
                        string truncatedValue = value.Substring(0, 25);
                        truncatedValue += "...";
                        lastMessage = truncatedValue;
                    }
                    else
                    {
                        lastMessage = value;
                    } 
                }
            }
        }

        // Default constructor
        public ConversationSummary()
        {
        }
    }
}
