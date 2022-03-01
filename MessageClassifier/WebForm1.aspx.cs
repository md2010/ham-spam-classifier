using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace MessageClassifier
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static string result;
        public static string messageText;
        protected void Page_Load(object sender, EventArgs e) { }

        protected void button_Click(object sender, EventArgs e)
        {
            examples.Visible = false;
            messageText = message.Text.ToString();
            if (messageText.Length > 0)
            {
                var t = Task.Run(() => check(new Uri("https://ussouthcentral.services.azureml.net/workspaces/8950d6a71d1a4cc78f5bb2e35c596fcb/services/30894b73b3ea4033b9c7dd7a0a8c2dfb/execute?api-version=2.0&format=swagger")));
                t.Wait();

                if (result.Contains("ham"))
                {
                    lblResults.Text = "ham";
                }
                else if (result.Contains("spam"))
                {
                    lblResults.Text = "spam!!!";
                }
            }
            else if (messageText.Length == 0)
            {
                message.Text = "ERROR: Empty message!";
            }
        }

        static async Task check(Uri u)
        {
            using (var client = new HttpClient())
            {
                var scoreRequest = new
                {
                    Inputs = new Dictionary<string, List<Dictionary<string, string>>>() {
                    {
                        "input1",
                        new List<Dictionary<string, string>>(){new Dictionary<string, string>(){
                                        {
                                            "message", messageText
                                        },
                            }
                        }
                    },
                },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };
                const string apiKey = "SZ4SfOrqUD0FnSFN4LD49rS4icgfZsliaDElwFf4i3jwRe3h19h8sRcSAfcAXocGOkO9C1t+bapPt22oQUsS1A=="; // Replace this with the API key for the web service
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);
                string json = JsonConvert.SerializeObject(scoreRequest);
                HttpContent content = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(u, content);

                if (response.IsSuccessStatusCode)
                {
                    result = await response.Content.ReadAsStringAsync();
                }
                else
                {
                    Console.WriteLine(string.Format("The request failed with status code: {0}", response.StatusCode));
                    result = await response.Content.ReadAsStringAsync();
                }
            }
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            message1.Text = "Hey, what's going on?";
            message2.Text = "SMS Reply WIN and iPhone 12 is yours!!!!!!";
            examples.Visible = true;
        }
    }
}

