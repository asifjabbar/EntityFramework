using DBFirst.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBFirst.Helper
{
    public class OrderHelper
    {

        Assign3DBEntities dBEntities = new Assign3DBEntities();

        public void placeorder(Order model)
        {
            Order o = new Order()
            {
                OrderDate = DateTime.Now,
                Status = model.Status,
                OrderedItems = model.OrderedItems,
                Address = model.Address,
                Contact = model.Contact,
                TotalAmount = model.TotalAmount
            };

            dBEntities.Orders.Add(o);
            dBEntities.SaveChanges();
        }

    }
}