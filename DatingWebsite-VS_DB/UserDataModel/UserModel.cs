using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModels
{
    public class UserModel
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }

        public string AgeRange { get; set; }
        public string Build { get; set; }
        public string EyeColor { get; set; }
        public string Gender { get; set; }
        public string HairColor { get; set; }
        public string Height { get; set; }
        public string SexualOrientation { get; set; }
        public List<int> Hobbies { get; set; }
        public string RelationshipStatus { get; set; }
        public string Ethnicity { get; set; }
        public string Town{ get; set; }
        public string County { get; set; }
        public string Profession { get; set; }
        public string IdealDate { get; set; }
        public string Comment {get;set;}
        public int Age { get; set; }


        public UserModel(){
            Hobbies = new List<int>();
        }

        public UserModel(string Username, string Password)
        {
            this.Username = Username;
            this.Password = Password;
            Hobbies = new List<int>();
        }

        public UserModel(int ID, string Username, string Password)
        {
            this.ID = ID;
            this.Username = Username;
            this.Password = Password;
            Hobbies = new List<int>();
        }
    }
}
