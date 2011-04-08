﻿using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class MItemRepository : NHibernateRepositoryWithTypedId<MItem, string>, IMItemRepository
    {
        public IEnumerable<MItem> GetPagedItemList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows, string itemId, string itemName)
        {
            ICriteria criteria = CreateNewCriteria(itemId, itemName);   

            //calculate total rows
            totalRows = criteria
                .SetProjection(Projections.RowCount())
                .FutureValue<int>().Value;

            //get list results
            criteria = CreateNewCriteria(itemId, itemName); 
            criteria.SetMaxResults(maxRows)
              .SetFirstResult((pageIndex - 1) * maxRows)
              .AddOrder(new Order(orderCol, orderBy.Equals("asc") ? true : false))
              ;

            IEnumerable<MItem> list = criteria.List<MItem>();
            return list;
        }

        private ICriteria CreateNewCriteria(string itemId, string itemName)
        {
            ICriteria criteria = Session.CreateCriteria(typeof(MItem));
            if (!string.IsNullOrEmpty(itemId))
            {
                criteria.Add(Expression.Like("Id", itemId, MatchMode.Anywhere));
            }
            if (!string.IsNullOrEmpty(itemName))
            {
                criteria.Add(Expression.Like("ItemName", itemName, MatchMode.Anywhere));
            }
            return criteria;
        }
    }
}