using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;
using SharpArch.Core;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Web.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Web.Controllers.ViewModel
{
   public class ListBillingViewModel
    {
       public static ListBillingViewModel Create(string disp)
       {
           ListBillingViewModel viewModel = new ListBillingViewModel();
           if (disp.Equals("Print")) viewModel.ViewPrint = true;
           if (disp.Equals("Delete")) viewModel.ViewDelete = true;

           return viewModel;
       }
       public bool ViewPrint { get; internal set; }
       public bool ViewDelete { get; internal set; }
    }
}
