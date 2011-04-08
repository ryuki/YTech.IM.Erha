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
   public class DetailItemFormViewModel
    {
       public static DetailItemFormViewModel Create(string packetId, IMPacketItemCatRepository mPacketItemCatRepository)
        {
            DetailItemFormViewModel viewModel = new DetailItemFormViewModel();
           viewModel.PacketItemCatList = mPacketItemCatRepository.GetByPacketId(packetId);
            return viewModel;
        }
        public IList<MPacketItemCat> PacketItemCatList { get; internal set; }
    }
}
