using SharpArch.Core.PersistenceSupport.NHibernate;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class RefAddressRepository : NHibernateRepositoryWithTypedId<RefAddress, string>, IRefAddressRepository
    {
    }
}
