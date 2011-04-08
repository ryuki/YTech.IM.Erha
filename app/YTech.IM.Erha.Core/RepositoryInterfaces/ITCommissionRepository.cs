using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction.Inventory;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
  public  interface ITCommissionRepository : INHibernateRepositoryWithTypedId<TCommission, string>
    {
        TCommission GetByTransDetAndCommissionType(Transaction.TTransDet det, Enums.EnumCommissionPeople enumCommissionPeople);

        IList<TCommission> GetByTransDate(System.DateTime dateFrom, System.DateTime dateTo);
    }
}
