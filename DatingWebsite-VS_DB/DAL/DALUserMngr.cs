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
    /* DO NOT CHANGE UNLESS YOU MATCH POSITION TO STORED PROCEDURE FIRST!!! */
    enum UserProfile
    {
        User,
        Email,
        Age, 
        AgeRange,
        Build,
        County,
        Ethnicity,
        EyeColor,
        Gender,
        HairColor,
        Height, 
        Hobbies,
        IdealDate,
        RelationshipStatus,
        Profession,
        SexualOrientation,
        Town,
        ProfilePicturePath,
        Comments
    }

    /* User Manager Contains methods for creating and authenticating (log in) users */
    public class DALUserMngr
    {
        private string conString;

        /* Constructor  - loads connection string from config file */
        public DALUserMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[Resources.CS_NAME].ConnectionString;
        }

        /* 
         * Login Method
         * Uses stored proc in DB to verify username & password
         * If successful, the user's ID is returned
         */
        public int DALLogin(string username, string password)
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
        public int DALCreateUser(string username, string email, string password)
        {
            int userID = 0;
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.USER_CREATE_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(Resources.USERNAME_PARAM, SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add(Resources.PASSWORD_PARAM, SqlDbType.NVarChar).Value = password;
                    cmd.Parameters.Add(Resources.EMAIL_PARAM, SqlDbType.NVarChar).Value = email;

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
        public bool DALUserExists(string username)
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

                    return exists;
                }
            }
        }
        /* OUT OF DATE - MISSING PARAMS*/
        //public void DALAddUserInformation(int userID, string town, string county, string prof, string eye, string hair, string status, string ethnicity, string gender, string orientation, string build, string height, int age, string idealdate, string comment)
        //{
        //    String proc = "uspAddAllUserDetails";

        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(proc, con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            cmd.Parameters.Add(Resources.USERID_PARAM, SqlDbType.Int).Value = userID;
        //            cmd.Parameters.Add(Resources.PROFESSION_PARAM, SqlDbType.NVarChar).Value = prof;
        //            cmd.Parameters.Add(Resources.TOWN_PARAM, SqlDbType.NVarChar).Value = town;
        //            cmd.Parameters.Add(Resources.COUNTY_PARAM, SqlDbType.NVarChar).Value = county;
        //            cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = gender;
        //            cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = orientation;
        //            cmd.Parameters.Add(Resources.AGE_PARAM, SqlDbType.Int).Value = age;
        //            cmd.Parameters.Add(Resources.ETHNICITY_PARAM, SqlDbType.NVarChar).Value = ethnicity;
        //            cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = status;
        //            cmd.Parameters.Add(Resources.HAIR_COLOR_PARAM, SqlDbType.NVarChar).Value = hair;
        //            cmd.Parameters.Add(Resources.EYE_COLOR_PARAM, SqlDbType.NVarChar).Value = eye;
        //            cmd.Parameters.Add(Resources.HEIGHT_PARAM, SqlDbType.NVarChar).Value = height;
        //            cmd.Parameters.Add(Resources.BUILD_PARAM, SqlDbType.NVarChar).Value = build;
        //            cmd.Parameters.Add(Resources.IDEAL_DATE_PARAM, SqlDbType.NVarChar).Value = idealdate;
        //            cmd.Parameters.Add(Resources.COMMENT_PARAM, SqlDbType.NVarChar).Value = comment;
        //        }
        //    }
        //}


        public void DALUpdateUser(UserModel user)
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
                        cmd.Parameters.Add(Resources.TOWN_PARAM, SqlDbType.NVarChar).Value = user.Town;
                    if (user.County != null)
                        cmd.Parameters.Add(Resources.COUNTY_PARAM, SqlDbType.NVarChar).Value = user.County;
                    if (user.Gender != null)
                        cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = user.Gender;
                    if (user.SexualOrientation != null)
                        cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = user.SexualOrientation;
                    if (user.Age > 0)
                        cmd.Parameters.Add(Resources.AGE_PARAM, SqlDbType.Int).Value = user.Age;
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
                    if (user.RelationshipStatus != null)
                        cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = user.RelationshipStatus;
                    if (user.IdealDate != null)
                        cmd.Parameters.Add(Resources.IDEAL_DATE_PARAM, SqlDbType.NVarChar).Value = user.IdealDate;
                    if (user.Comments != null)
                        cmd.Parameters.Add(Resources.COMMENT_PARAM, SqlDbType.NVarChar).Value = user.Comments;
                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                    }
                    catch (SqlException e)
                    {
                        throw new Exception("Error Adding Attributes to User: "+e.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        public UserModel DALGetUser(int id)
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
                        if (reader.Read())
                        {
                            user = new UserModel();
                            user.ID = id;

                            int position = (int)UserProfile.User;

                            if (!reader.IsDBNull(position) )
                                user.Username = reader.GetString(position);

                            if (!reader.IsDBNull((int)UserProfile.Age)) user.Age = reader.GetInt32((int)UserProfile.Age);
                            if (!reader.IsDBNull((int)UserProfile.Build)) user.Build = reader.GetString((int)UserProfile.Build);
                            if (!reader.IsDBNull((int)UserProfile.County)) user.County = reader.GetString((int)UserProfile.County);
                            if (!reader.IsDBNull((int)UserProfile.Email)) user.Email = reader.GetString((int)UserProfile.Email);
                            if (!reader.IsDBNull((int)UserProfile.Ethnicity)) user.Ethnicity = reader.GetString((int)UserProfile.Ethnicity);
                            if (!reader.IsDBNull((int)UserProfile.EyeColor)) user.EyeColor = reader.GetString((int)UserProfile.EyeColor);
                            if (!reader.IsDBNull((int)UserProfile.Gender)) user.Gender = reader.GetString((int)UserProfile.Gender);
                            if (!reader.IsDBNull((int)UserProfile.HairColor)) user.HairColor = reader.GetString((int)UserProfile.HairColor);
                            if (!reader.IsDBNull((int)UserProfile.Height)) user.Height = reader.GetString((int)UserProfile.Height);
                            //hobbies - parse xml
                            if (!reader.IsDBNull((int)UserProfile.IdealDate)) user.IdealDate = reader.GetString((int)UserProfile.IdealDate);
                            if (!reader.IsDBNull((int)UserProfile.Profession)) user.Profession = reader.GetString((int)UserProfile.Profession);
                            if (!reader.IsDBNull((int)UserProfile.RelationshipStatus)) user.RelationshipStatus = reader.GetString((int)UserProfile.RelationshipStatus);
                            if (!reader.IsDBNull((int)UserProfile.SexualOrientation)) user.SexualOrientation = reader.GetString((int)UserProfile.SexualOrientation);
                            if (!reader.IsDBNull((int)UserProfile.Town)) user.Town = reader.GetString((int)UserProfile.Town);
                            if (!reader.IsDBNull((int)UserProfile.ProfilePicturePath)) user.ProfilePicturePath = reader.GetString((int)UserProfile.ProfilePicturePath);
                            if (!reader.IsDBNull((int)UserProfile.Comments)) user.Comments = reader.GetString((int)UserProfile.Comments);
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

        public UserModel DALGetUser(string username)
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
                            if (!reader.IsDBNull((int)UserProfile.User)) user.ID = reader.GetInt32((int)UserProfile.User);
                            if (!reader.IsDBNull((int)UserProfile.Age)) user.Age = reader.GetInt32((int)UserProfile.Age);
                            if (!reader.IsDBNull((int)UserProfile.Build)) user.Build = reader.GetString((int)UserProfile.Build);
                            if (!reader.IsDBNull((int)UserProfile.County)) user.County = reader.GetString((int)UserProfile.County);
                            if (!reader.IsDBNull((int)UserProfile.Email)) user.Email = reader.GetString((int)UserProfile.Email);
                            if (!reader.IsDBNull((int)UserProfile.Ethnicity)) user.Ethnicity = reader.GetString((int)UserProfile.Ethnicity);
                            if (!reader.IsDBNull((int)UserProfile.EyeColor)) user.EyeColor = reader.GetString((int)UserProfile.EyeColor);
                            if (!reader.IsDBNull((int)UserProfile.Gender)) user.Gender = reader.GetString((int)UserProfile.Gender);
                            if (!reader.IsDBNull((int)UserProfile.HairColor)) user.HairColor = reader.GetString((int)UserProfile.HairColor);
                            if (!reader.IsDBNull((int)UserProfile.Height)) user.Height = reader.GetString((int)UserProfile.Height);
                            //hobbies - parse xml
                            if (!reader.IsDBNull((int)UserProfile.IdealDate)) user.IdealDate = reader.GetString((int)UserProfile.IdealDate);
                            if (!reader.IsDBNull((int)UserProfile.Profession)) user.Profession = reader.GetString((int)UserProfile.Profession);
                            if (!reader.IsDBNull((int)UserProfile.RelationshipStatus)) user.RelationshipStatus = reader.GetString((int)UserProfile.RelationshipStatus);
                            if (!reader.IsDBNull((int)UserProfile.SexualOrientation)) user.SexualOrientation = reader.GetString((int)UserProfile.SexualOrientation);
                            if (!reader.IsDBNull((int)UserProfile.Town)) user.Town = reader.GetString((int)UserProfile.Town);
                            if (!reader.IsDBNull((int)UserProfile.ProfilePicturePath)) user.ProfilePicturePath = reader.GetString((int)UserProfile.ProfilePicturePath);
                            if (!reader.IsDBNull((int)UserProfile.Comments)) user.Comments = reader.GetString((int)UserProfile.Comments);
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



        public List<int> DALGetHobbies(int id)
        {
            string sql = "SELECT "+Resources.HOBBIES_ID_COLUMN+" FROM " + Resources.USER_HOBBIES_TABLE + " WHERE UserID =" + id;
            List<int> hobbies = null;
            SqlDataReader reader;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        hobbies = new List<int>();
                        reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            hobbies.Add(reader.GetInt32(0));
                        }
                    }
                    catch (SqlException e)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return hobbies;
        }

        public void DALSetHobbies(UserModel user)
        {
            int rowsAffected;

            if(user == null)
                return;
            if(user.Hobbies.Count <= 0)
                return;
            
            string sql = "INSERT INTO "+Resources.USER_HOBBIES_TABLE + " VALUES ";
            foreach (int hobbyID in user.Hobbies)
            {
                sql += "(" + user.ID + ",'" + hobbyID + "')";
            }

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = CommandType.Text;

                    con.Open();
                    try
                    {
                        rowsAffected = cmd.ExecuteNonQuery();

                    }
                    catch (SqlException e)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
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
