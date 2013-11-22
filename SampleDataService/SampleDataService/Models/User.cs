using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleDataService.Models
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public User()
        {
            Username = string.Empty;
            Password = string.Empty;
        }

        public bool Valid()
        {
            return Username == "bta" && Password == "123";
        }
    }
}