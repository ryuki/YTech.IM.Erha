using System;
using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITStockCardRepository : INHibernateRepositoryWithTypedId<TStockCard, string>
    {
        IList<TStockCard> GetByDateItemWarehouse(DateTime? dateFrom, DateTime? dateTo, MItem item,MWarehouse warehouse);
    }
}
