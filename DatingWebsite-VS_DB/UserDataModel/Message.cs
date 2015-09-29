using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModels
{
    public class Message: IComparable<Message>
    {
        public int SenderID { get; set; }
        public DateTime Timestamp { get; set; }
        public string Content { get; set; }

        public int CompareTo(Message other)
        {
            return this.Timestamp.CompareTo(other.Timestamp);
        }
    }

    

}
