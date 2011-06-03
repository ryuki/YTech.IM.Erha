using System;
using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Accounting;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITJournalDetRepository : INHibernateRepositoryWithTypedId<TJournalDet, string>
    {
        IList<TJournalDet> GetForReport(DateTime? dateFrom, DateTime? dateTo, MCostCenter costCenter);

        IList<TJournalDet> GetDetailByJournalId(string journalId);
    }
}
