using System;
using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.HR;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITAbsentRepository : INHibernateRepositoryWithTypedId<TAbsent, string>
    {
        IList<TAbsent> GetAbsent(DateTime? dayWork);
        IList<TAbsent> GetAbsentByEmployeeId(MEmployee employeeId);
        IList<TAbsent> GetAbsentByEmployeeId(MEmployee employeeId, DateTime? workDay);
        IList<TAbsent> GetAbsentByEmployeeId(MEmployee employeeId, DateTime startPeriod, DateTime endPeriod);
    }
}
