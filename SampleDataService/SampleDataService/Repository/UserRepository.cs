using SampleDataService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleDataService.Repository
{
    public static class UserRepository
    {
        private static List<string> _tokens;

        internal static string Authenticate(User user)
        {
            var valid = user.Valid();
            if (!valid)
            {
                throw new Exception("Invalid user.");
            }
            Initialize();
            var token = Guid.NewGuid().ToString().Replace("-", "");
            _tokens.Add(token);
            return token;
        }

        internal static bool Authenticate(string token)
        {
            if (string.IsNullOrEmpty(token))
            {
                return false;
            }
            Initialize();
            return _tokens.Contains(token);
        }

        private static void Initialize()
        {
            if (_tokens == null)
            {
                _tokens = new List<string>();
            }
        }
    }
}