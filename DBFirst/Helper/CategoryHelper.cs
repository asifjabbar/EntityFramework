using DBFirst.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBFirst.Helper
{
    public class CategoryHelper
    {
        Assign3DBEntities dBEntities = new Assign3DBEntities();


        public void addproduct(Category model)
        {

            Category p = new Category()
            {
                Name = model.Name,
                Description=model.Description,
               
            };

            dBEntities.Categories.Add(p);
            dBEntities.SaveChanges();


        }
    }
}