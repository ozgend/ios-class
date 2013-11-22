using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace SampleDataService
{
    public static class CustomerRepository
    {
        const string _filePath = @"D:\Dev\SampleDataService\SampleDataService\customer.json";
        const int _pageSize = 30;

        private static List<Customer> _customers;


        internal static List<Customer> GetCustomers()
        {
            LoadData(force: false);
            return _customers;
        }

        internal static List<Customer> GetCustomersPaged(int targetPageNo)
        {
            targetPageNo = targetPageNo > 0 ? targetPageNo : 1;
            var list = GetCustomers();
            var paged = list.Skip((targetPageNo - 1) * _pageSize).Take(_pageSize).ToList();
            return paged;
        }

        internal static List<string> GetCustomerNames()
        {
            var names = GetCustomers().Select(c => c.ToString()).ToList();
            return names;
        }

        internal static void EditCustomer(Customer customer)
        {
            if (customer != null && customer.Id > 0)
            {
                LoadData(force: false);
                _customers.RemoveAll(c => c.Id == customer.Id);
                _customers.Add(customer);
                PersistData();
            }
            else
            {
                throw new InvalidDataException("Invalid or no customer.");
            }
        }

        private static void PersistData()
        {
            var serialized = JsonConvert.SerializeObject(_customers);
            File.WriteAllText(_filePath, serialized);
            LoadData(force: true);
        }

        private static void LoadData(bool force)
        {
            if (force || _customers == null || _customers.Count == 0)
            {
                string serialized = File.ReadAllText(_filePath);
                _customers = JsonConvert.DeserializeObject<List<Customer>>(serialized).OrderBy(c => c.Id).ToList();
            
            }
        }
    }
}

