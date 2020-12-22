using DBFirst.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBFirst.Helper
{
    public class ProductHelper
    {
        Assign3DBEntities dBEntities = new Assign3DBEntities();




        public void addproduct(Product model)
        {

            Product p = new Product()
            {
                Name = model.Name,
                Price = model.Price,
                Description = model.Description,
                CategoryId = model.CategoryId
            };

            dBEntities.Products.Add(p);
            dBEntities.SaveChanges();


        }
    }
}