﻿using System.Collections.Generic;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class MPacketItemCatRepository: NHibernateRepositoryWithTypedId<MPacketItemCat, string>, IMPacketItemCatRepository
    {
        #region IMPacketItemCatRepository Members

        public IEnumerable<MPacketItemCat> GetPagedItemList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows,string packetId)
        {
            MPacket mPacket=null;
            if (!string.IsNullOrEmpty(packetId))
            {
                 mPacket = new MPacketRepository().Get(packetId);
            }

            ICriteria criteria = Session.CreateCriteria(typeof(MPacketItemCat));

            //calculate total rows
            if (mPacket != null)
                criteria.Add(Expression.Eq("PacketId", mPacket));
            totalRows = criteria
                .SetProjection(Projections.RowCount())
                .FutureValue<int>().Value;

            //get list results
            criteria = Session.CreateCriteria(typeof(MPacketItemCat));
            if (mPacket != null)
                criteria.Add(Expression.Eq("PacketId", mPacket));
            criteria.SetMaxResults(maxRows)
              .SetFirstResult((pageIndex - 1) * maxRows)
              .AddOrder(new Order(orderCol, orderBy.Equals("asc") ? true : false))
              ;

            IEnumerable<MPacketItemCat> list = criteria.List<MPacketItemCat>();
            return list;
        }


        public IList<MPacketItemCat> GetByPacketId(string packetId)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select pac
                                from MPacketItemCat as pac");
            if (!string.IsNullOrEmpty(packetId))
            {
                sql.AppendLine(@" where pac.PacketId = :packetId");
            }
            IQuery q = Session.CreateQuery(sql.ToString());
            if (!string.IsNullOrEmpty(packetId))
            {
                MPacket mPacket = new MPacketRepository().Get(packetId);
                q.SetEntity("packetId", mPacket);
            }

            return q.List<MPacketItemCat>();

        }
        #endregion
    }
}
