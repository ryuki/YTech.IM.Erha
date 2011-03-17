using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface IMAccountRefRepository : INHibernateRepositoryWithTypedId<MAccountRef, string>
    {

        MAccountRef GetByRefTableId(Enums.EnumReferenceTable enumReferenceTable, string warehouseId);
    }
}
