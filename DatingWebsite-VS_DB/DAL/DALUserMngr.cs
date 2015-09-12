using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using DataModels;
using ResourceTier;


namespace DAL //Data Access Layer
{
    enum UserProfile { User, Email, Town, County, Profession, EyeColor, HairColor, Age, Gender, SexualOrientation, RelationshipStatus, Ethnicity, Build, Height, PicturePath,IdealDate,Comment}
 
    /* User Manager Contains methods for creating and authenticating (log in) users */
    public class DALUserMngr
    {
        private const string CS_NAME = "DatingDB";
        //private const string USER_INFORMATION_TABLE = "UserInformation";

        private string conString;

        /* Constructor  - loads connection string from config file */
        public DALUserMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        /* 
         * Login Method
         * Uses stored proc in DB to verify username & password
         * If successful, the user's ID is returned
         */
        public int Login(string username, string password)
        {
            int UserID = 0;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_LOGIN_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(Resources.USERNAME_PARAM, SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add(Resources.PASSWORD_PARAM, SqlDbType.NVarChar).Value = password;

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            UserID = reader.GetInt32(0);
                        }
                        reader.Close();
                        con.Close();
                    }
                }
            }
            return UserID;
        }


        /* 
         * CreateUser Method
         * Uses stored proc in DB to create new user
         * If successful, the user's ID is returned
         */
        public int CreateUser(UserModel user)
        {
            int userID = 0;
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_CREATE_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(Resources.USERNAME_PARAM, SqlDbType.NVarChar).Value = user.Username;
                    cmd.Parameters.Add(Resources.PASSWORD_PARAM, SqlDbType.NVarChar).Value = user.Password;
                    cmd.Parameters.Add(Resources.EMAIL_PARAM, SqlDbType.NVarChar).Value = user.Email;

                    con.Open();
                    try
                    {
                        userID = (int)cmd.ExecuteScalar();

                    }
                    catch (SqlException e)
                    {
                        userID = 0;
                    }
                    finally
                    {
                        con.Close();
                    }
                    
                }
                
            }

            return userID;
        }

        /*
         * check if a username is available
         */
        public bool userExists(string username)
        {
            bool exists = true;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USERNAME_EXISTS_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(Resources.USERNAME_PARAM, SqlDbType.NVarChar).Value = username;
                    con.Open();
                    try
                    {
                        Object obj = cmd.ExecuteScalar();
                        string s = obj.ToString();
                        exists = Convert.ToBoolean(obj);
                    }
                    catch (SqlException e)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }

                    return  exists;
                }
            }
        }

        public void addUserInformation(int userID, string town,string county, string prof, string eye, string hair, string ethnic,string status, string gender, string orientation, string build, string height, int age,string idealdate,string comments)
        { 
            String proc = "uspAddUserDetails";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(proc, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(Resources.USERID_PARAM, SqlDbType.Int).Value = userID;
                    cmd.Parameters.Add(Resources.PROFESSION_PARAM, SqlDbType.NVarChar).Value = prof;
                    cmd.Parameters.Add(Resources.TOWN_COLUMN, SqlDbType.NVarChar).Value = town;
                    cmd.Parameters.Add(Resources.COUNTY_COLUMN, SqlDbType.NVarChar).Value = county;
                    cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = gender;
                    cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = orientation;
                    cmd.Parameters.Add(Resources.AGE_PARAM, SqlDbType.Int).Value = age;
                    cmd.Parameters.Add(Resources.ETHNICITY_PARAM, SqlDbType.NVarChar).Value = ethnic;
                    cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = status;
                    cmd.Parameters.Add(Resources.HAIR_COLOR_PARAM, SqlDbType.NVarChar).Value = hair;
                    cmd.Parameters.Add(Resources.EYE_COLOR_PARAM, SqlDbType.NVarChar).Value = eye;
                    cmd.Parameters.Add(Resources.HEIGHT_PARAM, SqlDbType.NVarChar).Value = height;
                    cmd.Parameters.Add(Resources.BUILD_PARAM, SqlDbType.NVarChar).Value = build;
                    cmd.Parameters.Add(Resources.IDEAL_DATE_PARAM, SqlDbType.NVarChar).Value = idealdate;
                    cmd.Parameters.Add(Resources.COMMENT_PARAM, SqlDbType.NVarChar).Value = comments;
               }
            }
        }


        public void updateUser(UserModel user)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_UPDATE_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (user.ID > 0)
                        cmd.Parameters.Add(Resources.USERID_PARAM, SqlDbType.Int).Value = user.ID;
                    else
                        return;

                    if (user.Profession != null)
                        cmd.Parameters.Add(Resources.PROFESSION_PARAM, SqlDbType.NVarChar).Value = user.Profession;
                    if (user.Town != null)
                        cmd.Parameters.Add(Resources.TOWN_COLUMN, SqlDbType.NVarChar).Value = user.Town;
                     if (user.County != null)
                        cmd.Parameters.Add(Resources.COUNTY_COLUMN, SqlDbType.NVarChar).Value = user.County;
                    if (user.Gender != null)
                        cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = user.Gender;
                    if (user.SexualOrientation != null)
                        cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = user.SexualOrientation;
                    if (user.Age > 0)
                        cmd.Parameters.Add(Resources.AGE_PARAM, SqlDbType.Int).Value = user.Age;
                    if (user.RelationshipStatus != null)
                        cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = user.RelationshipStatus;
                    if (user.HairColor != null)
                        cmd.Parameters.Add(Resources.HAIR_COLOR_PARAM, SqlDbType.NVarChar).Value = user.HairColor;
                    if (user.EyeColor != null)
                        cmd.Parameters.Add(Resources.EYE_COLOR_PARAM, SqlDbType.NVarChar).Value = user.EyeColor;
                    if (user.Height != null)
                        cmd.Parameters.Add(Resources.HEIGHT_PARAM, SqlDbType.NVarChar).Value = user.Height;
                    if (user.Build != null)
                        cmd.Parameters.Add(Resources.BUILD_PARAM, SqlDbType.NVarChar).Value = user.Build;
                    if (user.Ethnicity != null)
                        cmd.Parameters.Add(Resources.ETHNICITY_PARAM, SqlDbType.NVarChar).Value = user.Ethnicity;
                    if (user.IdealDate != null)
                        cmd.Parameters.Add(Resources.IDEAL_DATE_PARAM, SqlDbType.NVarChar).Value = user.IdealDate;
                    if (user.Comment!= null)
                        cmd.Parameters.Add(Resources.COMMENT_PARAM, SqlDbType.NVarChar).Value = user.Comment;
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();
                     
                }
            }
        }

        public UserModel getUser(int id)
        {
            UserModel user = null;
            SqlDataReader reader;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_PROFILE_ID_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(Resources.USERID_PARAM, SqlDbType.NVarChar).Value = id;

                    try
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();
                        if(reader.Read())
                        {
                            user = new UserModel();
                            user.ID = id;
                            int i = (int)UserProfile.User;
                            user.Username = reader.GetString(i);
                            user.Email = reader.GetString((int)UserProfile.Email);
                            user.Town = reader.GetString((int)UserProfile.Town);
                            user.County = reader.GetString((int)UserProfile.County);
                            user.Profession = reader.GetString((int)UserProfile.Profession);
                            user.EyeColor = reader.GetString((int)UserProfile.EyeColor);
                            user.HairColor = reader.GetString((int)UserProfile.HairColor);
                            user.Gender = reader.GetString((int)UserProfile.Gender);
                            user.SexualOrientation = reader.GetString((int)UserProfile.SexualOrientation);
                            user.Ethnicity = reader.GetString((int)UserProfile.Ethnicity);
                            user.RelationshipStatus = reader.GetString((int)UserProfile.RelationshipStatus);
                            user.Build = reader.GetString((int)UserProfile.Build);
                            user.Height = reader.GetString((int)UserProfile.Height);
                            user.IdealDate = reader.GetString((int)UserProfile.IdealDate);
                            user.Comment = reader.GetString((int)UserProfile.Comment);
                            //user.PicturePath = reader.GetString((int)UserProfile.PicturePath);
                            user.Age = reader.GetInt32((int)UserProfile.Age);
                        }
                        reader.Close();
                    }
                    catch (SqlException e)
                    {
                        // go to error page
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }

                }
            }
            return user;
        }

        public UserModel getUser(string username)
        {
            UserModel user = null;
            SqlDataReader reader;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_PROFILE_USERNAME_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(Resources.USERNAME_PARAM, SqlDbType.NVarChar).Value = username;

                    try
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            user = new UserModel();
                            user.Username = username;
                            user.ID = reader.GetInt32((int)UserProfile.User);
                            user.Email = reader.GetString((int)UserProfile.Email);
                            user.Town = reader.GetString((int)UserProfile.Town);
                            user.County = reader.GetString((int)UserProfile.County);
                            user.Profession = reader.GetString((int)UserProfile.Profession);
                            user.EyeColor = reader.GetString((int)UserProfile.EyeColor);
                            user.HairColor = reader.GetString((int)UserProfile.HairColor);
                            user.Gender = reader.GetString((int)UserProfile.Gender);
                            user.SexualOrientation = reader.GetString((int)UserProfile.SexualOrientation);
                            user.Build = reader.GetString((int)UserProfile.Build);
                            user.Height = reader.GetString((int)UserProfile.Height);
                            user.Ethnicity = reader.GetString((int)UserProfile.Ethnicity);
                            user.RelationshipStatus = reader.GetString((int)UserProfile.RelationshipStatus);
                            user.IdealDate = reader.GetString((int)UserProfile.IdealDate);
                            user.Comment = reader.GetString((int)UserProfile.Comment);
                            //user.PicturePath = reader.GetString((int)UserProfile.PicturePath);
                            user.Age = reader.GetInt32((int)UserProfile.Age);
                        }
                        reader.Close();
                    }
                    catch (SqlException e)
                    {
                        // go to error page
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }

                }
            }
            return user;
        }

    //    public void addUserInformation(int userID ,Dictionary<string, string> userAttributes)
    //    {
    //        string sqlStart = "UPDATE ";
    //        string sqlMiddle = " SET ";
    //        string sqlEnd = " WHERE UserID=";
    //        string kvString = userAttributes.Keys.ElementAt(0);

    //        for (int i = 1; i < userAttributes.Count;i++)
    //        {
    //            kvString += kvp.Key + ",";
    //        }
    //        kvString = kvString.Substring(0, kvString.Length - 2);

    //        string query = sqlStart + USER_INFORMATION_TABLE + kvString + sqlMiddle + userID;
    //    }
    }
}
