using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction.Accounting;

namespace YTech.IM.Erha.Data.Repository
{
    public class TJournalRefRepository : NHibernateRepositoryWithTypedId<TJournalRef, string>, ITJournalRefRepository
    {
    }
}
