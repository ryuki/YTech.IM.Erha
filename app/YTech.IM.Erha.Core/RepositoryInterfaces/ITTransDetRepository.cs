using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITTransDetRepository : INHibernateRepositoryWithTypedId<TTransDet, string>
    {
        IList<TTransDet> GetByItemWarehouse(MItem item, MWarehouse warehouse);

        decimal? GetTotalUsed(MItem item, MWarehouse warehouse);

        IList<TTransDet> GetListByRoom(MRoom room);

        IList<TTransDet> GetListByTransId(string transId, Enums.EnumTransactionStatus enumTransactionStatus);

        IList<TTransDet> GetListByTrans(TTrans trans);

        IList<TTransDet> GetListByDate(System.DateTime dateFrom, System.DateTime dateTo,EnumTransactionStatus transactionStatus);
    }
}
