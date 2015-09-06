using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserDataModel
{
    public class UserModel
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public string AgeRange { get; set; }
        public string Build { get; set; }
        public string EyeColor { get; set; }
        public string Gender { get; set; }
        public string HairColor { get; set; }
        public string Height { get; set; }
        public string SexualOrientation { get; set; }
        List<int> Hobbies = new List<int>();


        public UserModel(string Username, string Password)
        {
            this.Username = Username;
            this.Password = Password;
        }

        public UserModel(int ID, string Username, string Password)
        {
            this.ID = ID;
            this.Username = Username;
            this.Password = Password;
        }
    }
}
