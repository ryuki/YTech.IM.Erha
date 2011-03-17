using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface IMPacketItemCatRepository : INHibernateRepositoryWithTypedId<MPacketItemCat, string>
    {
        IEnumerable<MPacketItemCat> GetPagedItemList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows,string packetId);
        IList<MPacketItemCat> GetByPacketId(string packetId);
    }
}
