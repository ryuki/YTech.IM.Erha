using System;
using System.Collections.Generic;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction.Accounting;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Data.Repository
{
    public class TJournalRefRepository : NHibernateRepositoryWithTypedId<TJournalRef, string>, ITJournalRefRepository
    {
        public TJournalRef GetByReference(EnumReferenceTable enumReferenceTable, string transStatus, string transId)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select ref
                                from TJournalRef as ref
                                    where ref.ReferenceTable = :enumReferenceTable 
                                        and ref.ReferenceType = :transStatus 
                                        and ref.ReferenceId = :transId ");
            IQuery q = Session.CreateQuery(sql.ToString());
            q.SetMaxResults(1);
            q.SetString("enumReferenceTable", enumReferenceTable.ToString());
            q.SetString("transStatus", transStatus);
            q.SetString("transId", transId);
            return q.UniqueResult<TJournalRef>();
        }
    }
}
