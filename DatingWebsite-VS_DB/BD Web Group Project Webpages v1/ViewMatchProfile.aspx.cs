using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using DataModels;
using ResourceTier;
using BLL;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class ViewMatchProfile : System.Web.UI.Page
    {
        BLLUserMngr userManager;
        UserModel user;
        UserModel match;

        protected void Page_Load(object sender, EventArgs e)
        {

            userManager = new BLLUserMngr();
            user = userManager.BLLGetCurrentUser(Session);

            String username = Request.Params["username"];
            SendMsgLink.HRef = "ViewMatchProfile.aspx?username=" + username +"&newmessage=true";
            String sendNewMessage = Request.Params["newmessage"];

            if (!string.IsNullOrEmpty(username) && username.Length > 0)
            {
                match = userManager.BLLGetUser(username);
                lblUsername.Text = username;
                //imgProfilePicture.ImageUrl = user.ProfilePicturePath;
                lblUserDescription.Text = (match.Comments != null && match.Comments.Length > 0) ? match.Comments : "Guess I have nothing to say!";
                lblUserCounty.Text = match.County;
                lblUserProfesssion.Text = match.Profession;
                lblUserGender.Text = match.Gender;
                lblUserOrientation.Text = match.SexualOrientation;
                lblUserEyeColor.Text = match.EyeColor;
                lblUserHairColor.Text = match.HairColor;
                lblUserAge.Text = match.Age.ToString();
                hobbyRepeater.DataSource = userManager.BLLGetHobbiesTable(match.ID);
                hobbyRepeater.DataBind();
            }

            /* Show controls to send this match a message
             * or hide those controls if they're viewing their own profile.
             * */
            if (match != null && match.Username != user.Username)
            {
                if (!string.IsNullOrEmpty(sendNewMessage) && sendNewMessage.Equals("true"))
                {
                    SendMsgInput.Visible = true;
                    SendMsgLink.Visible = false;
                }
                else
                {
                    SendMsgInput.Visible = false;
                }
            }
            else
            {
                SendMsgInput.Visible = false;
                SendMsgLink.Visible = false;
            }
            
            // Reset feedback after message was sent.
            lblNewMessageFeedback.Text = "";
            
        }


        protected void imgBtnSendMessage_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                BLLMessageMngr messageManager = new BLLMessageMngr();

                Message newMessage = new Message();
                newMessage.SenderID = user.ID;
                newMessage.Timestamp = DateTime.Now;
                newMessage.Content = txtNewMessage.Text;

                Conversation newConvo = new Conversation();
                newConvo.ParticipantA_ID = user.ID;
                newConvo.ParticipantB_ID = match.ID;
                newConvo.MessagesList.Add(newMessage);

                if (messageManager.AddNewConversation(newConvo))
                {
                    txtNewMessage.Text = "";
                    lblNewMessageFeedback.Text = "Message sent";
                }
                else
                {
                    lblNewMessageFeedback.Text = "Sorry, wasn't able to send that message...";
                }

            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Error sending message. Message not delivered.')", true);
            }
        }
    }
}