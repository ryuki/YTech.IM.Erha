using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITTransRoomRepository : INHibernateRepositoryWithTypedId<TTransRoom, string>
    {

        TTransRoom GetByRoom(MRoom room);

        IList<TTransRoom> GetListByTransDate(System.DateTime? dateFrom, System.DateTime? dateTo, EnumTransRoomStatus RoomStatus);

        IEnumerable<TTransRoom> GetPagedTransRoomList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows, string searchBy, string searchText);
    }
}
