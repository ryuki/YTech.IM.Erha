using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface IRefPersonRepository : INHibernateRepositoryWithTypedId<RefPerson, string>
    {
        
    }
}
