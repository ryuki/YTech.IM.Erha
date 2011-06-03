using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Accounting;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITJournalRepository : INHibernateRepositoryWithTypedId<TJournal, string>
    {
        System.DateTime? GetMinDateJournal();

        IEnumerable<TJournal> GetPagedJournalList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows, string searchBy, string searchText, string journalType);
    }
}
