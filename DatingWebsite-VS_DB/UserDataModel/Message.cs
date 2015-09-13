using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModels
{
    class Message: IComparable<Message>
    {
        public int MessageID { get; set; }
        public UserModel SenderID { get; set; }
        public int ReceiverID { get; set; }
        public DateTime Timestamp { get; set; }
        public StringBuilder content { get; set; }

        public int CompareTo(Message other)
        {
            return this.Timestamp.CompareTo(other.Timestamp);
        }
    }

    

}
