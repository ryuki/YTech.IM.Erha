using System;
using System.Collections.Generic;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Data.Repository
{
    public class TTransDetRepository : NHibernateRepositoryWithTypedId<TTransDet, string>, ITTransDetRepository
    {
        public IList<TTransDet> GetByItemWarehouse(MItem item, MWarehouse warehouse)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select det
                                from TTransDet as det
                                    left outer join det.TransId trans
                                    where trans.TransStatus = :TransStatus ");
            if (item != null)
            {
                sql.AppendLine(@"   and det.ItemId = :item");
            }
            if (warehouse != null)
            {
                sql.AppendLine(@"   and trans.WarehouseId = :warehouse");
            }
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", Enums.EnumTransactionStatus.Budgeting.ToString());
            if (item != null)
            {
                q.SetEntity("item", item);
            }
            if (warehouse != null)
            {
                q.SetEntity("warehouse", warehouse);
            }
            return q.List<TTransDet>();
        }

        public decimal? GetTotalUsed(MItem item, MWarehouse warehouse)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select sum(det.TransDetQty)
                                from TTransDet as det
                                    left outer join det.TransId trans
                                    where trans.TransStatus = :TransStatus ");
            if (item != null)
            {
                sql.AppendLine(@"   and det.ItemId = :item");
            }
            if (warehouse != null)
            {
                sql.AppendLine(@"   and trans.WarehouseId = :warehouse");
            }

            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", Enums.EnumTransactionStatus.Using.ToString());
            if (item != null)
            {
                q.SetEntity("item", item);
            }
            if (warehouse != null)
            {
                q.SetEntity("warehouse", warehouse);
            }
            if (q.UniqueResult() != null)
            {
                 return (decimal)q.UniqueResult();
            }
            return null;
        }

        public IList<TTransDet> GetListByRoom(MRoom room)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select det
                                from TTransDet as det
                                    left outer join det.TransId trans, TTransRoom transRoom
                                        where trans.Id = transRoom.Id
                                    and trans.TransStatus = :TransStatus ");
            if (room != null)
            {
                sql.AppendLine(@"   and transRoom.RoomId = :room");
            }
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", Enums.EnumTransactionStatus.Service.ToString());
            if (room != null)
            {
                q.SetEntity("room", room);
            } 
            return q.List<TTransDet>();
        }

        public IList<TTransDet> GetListByTransId(string transId, Enums.EnumTransactionStatus enumTransactionStatus)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select det
                                from TTransDet as det
                                    left outer join det.TransId trans 
                                        where trans.TransStatus = :TransStatus ");
            if (!string.IsNullOrEmpty(transId))
            {
                sql.AppendLine(@"   and trans.Id = :transId");
            }
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", enumTransactionStatus.ToString());
            if (!string.IsNullOrEmpty(transId))
            {
                q.SetString("transId", transId);
            }
            return q.List<TTransDet>();
        }

        public IList<TTransDet> GetListByTrans(TTrans trans)
        {
            ICriteria criteria = Session.CreateCriteria(typeof(TTransDet));
            if (trans != null)
            {
                criteria.Add(Expression.Eq("TransId", trans));
            }

            IList<TTransDet> list = criteria.List<TTransDet>();
            return list;
        }

        public IList<TTransDet> GetListByDate(DateTime dateFrom, DateTime dateTo, EnumTransactionStatus transactionStatus)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select det
                                from TTransDet as det
                                    left outer join det.TransId trans 
                                        where trans.TransStatus = :TransStatus and trans.TransDate between :dateFrom and :dateTo ");
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", transactionStatus.ToString());
            q.SetDateTime("dateFrom", dateFrom);
            q.SetDateTime("dateTo", dateTo);
            return q.List<TTransDet>();
        }


        public IList<TTransDet> GetListByDateAndCustomer(DateTime? dateFrom, DateTime? dateTo, EnumTransactionStatus transactionStatus, string customerId)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select det
                                from TTransDet as det
                                    left outer join det.TransId trans 
                                        where trans.TransStatus = :TransStatus");
            if (dateFrom.HasValue && dateTo.HasValue)
            {
                sql.AppendLine("and trans.TransDate between :dateFrom and :dateTo");
            }
            sql.AppendLine(@"and trans.TransBy like :customerId 
                             order by trans.TransDate ");
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetString("TransStatus", transactionStatus.ToString());
            if (dateFrom.HasValue)
            {
                q.SetDateTime("dateFrom", dateFrom.Value);
            }
            if (dateTo.HasValue)
            {
                q.SetDateTime("dateTo", dateTo.Value);
            }
            q.SetString("customerId", customerId);
            return q.List<TTransDet>();
        }
    }
}
