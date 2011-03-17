using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITReferenceRepository : INHibernateRepositoryWithTypedId<TReference, string>
    {
        TReference GetByReferenceType(EnumReferenceType referenceType);

    }
}
