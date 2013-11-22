using System;

namespace SampleDataService
{
    public class Customer
    {
        public int Id { get; set; }

        public string Firstname { get; set; }

        public string Lastname { get; set; }

        public string Birthdate { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }

        public string Country { get; set; }

        public string City { get; set; }

        public string Phone { get; set; }

        public bool IsActive { get; set; }

        public override string ToString()
        {
            return string.Format("{0} {1}", Firstname, Lastname);
        }
    }
}
