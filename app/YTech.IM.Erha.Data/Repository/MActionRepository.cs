﻿using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class MActionRepository : NHibernateRepositoryWithTypedId<MAction, string>, IMActionRepository
    {
        public IEnumerable<MAction> GetPagedActionList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows)
        {
            ICriteria criteria = Session.CreateCriteria(typeof(MAction));

            //calculate total rows
            totalRows = Session.CreateCriteria(typeof(MAction))
                .SetProjection(Projections.RowCount())
                .FutureValue<int>().Value;

            //get list results
            criteria.SetMaxResults(maxRows)
              .SetFirstResult((pageIndex - 1) * maxRows)
              .AddOrder(new Order(orderCol, orderBy.Equals("asc") ? true : false))
              ;

            IEnumerable<MAction> list = criteria.List<MAction>();
            return list;
        }
    }
}
