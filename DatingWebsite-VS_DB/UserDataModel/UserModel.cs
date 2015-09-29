using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModels
{
    public class UserModel
    {
        private const string AGE_RANGE_1 = "18-25";
        private const string AGE_RANGE_2 = "26-32";
        private const string AGE_RANGE_3 = "33-39";
        private const string AGE_RANGE_4 = "40+";

        private int _age;
        private string _ageRange;

        public int ID { get; set; }
        public int Age
        {
            get
            {
                return _age;
            }
            set
            {
                _age = value;
                _ageRange = calculateAgeRange(value);
            }
        }
        public string AgeRange { get { return _ageRange; } }
        public string Username { get; set; }
        //public string Password { get; set; }
        public string Email { get; set; }
        public string Town { get; set; }
        public string County { get; set; }
        public string Build { get; set; }
        public string EyeColor { get; set; }
        public string Gender { get; set; }
        public string HairColor { get; set; }
        public string RelationshipStatus { get; set; }
        public string Ethnicity { get; set; }
        public string Height { get; set; }
        public string SexualOrientation { get; set; }
        public List<int> Hobbies { get; set; }
        public string IdealDate { get; set; }
        public string Profession { get; set; }
        public string ProfilePicturePath { get; set; }
        public string Comments { get; set; }

        public UserModel(){
            Hobbies = new List<int>();
        }

        //public UserModel(string Username, string Password)
        public UserModel(string Username)
        {
            this.Username = Username;
            this.ProfilePicturePath = "~/Images/blank-profile-grey.png";
            Hobbies = new List<int>();
        }
        
        //public UserModel(int ID, string Username, string Password)
        public UserModel(int ID, string Username)
        {
            this.ID = ID;
            this.Username = Username;
            this.ProfilePicturePath = "~/Images/blank-profile-grey.png";
            Hobbies = new List<int>();
        }

        private string calculateAgeRange(int age)
        {
            string range = "";
            if (age <= 25)
                range = AGE_RANGE_1;
            else if (age <= 32)
                range = AGE_RANGE_2;
            else if (age <= 39)
                range = AGE_RANGE_3;
            else 
                range = AGE_RANGE_3;
            return range;          
        }
    }
}
