﻿using System;
using System.Collections.Generic;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;

namespace YTech.IM.Erha.Data.Repository
{
    public class TStockCardRepository : NHibernateRepositoryWithTypedId<TStockCard, string>, ITStockCardRepository
    {
        public IList<TStockCard> GetByDateItemWarehouse(DateTime? dateFrom, DateTime? dateTo, MItem item, MWarehouse warehouse)
        {
            ICriteria criteria = Session.CreateCriteria(typeof(TStockCard));
            if (dateFrom.HasValue && dateTo.HasValue)
            {
                criteria.Add(Expression.Between("StockCardDate", dateFrom, dateTo));
            }
            if (item != null)
            {
                 criteria.Add(Expression.Eq("ItemId", item));
            }
           
            if (warehouse != null)
            {
                 criteria.Add(Expression.Eq("WarehouseId", warehouse));
            }
           
            criteria.SetCacheable(true);
            IList<TStockCard> list = criteria.List<TStockCard>();
            return list;
        }
    }
}
