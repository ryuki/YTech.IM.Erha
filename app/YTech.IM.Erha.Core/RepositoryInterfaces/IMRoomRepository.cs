﻿using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface IMRoomRepository : INHibernateRepositoryWithTypedId<MRoom, string>
    {
        IEnumerable<MRoom> GetPagedPacketList(string orderCol, string orderBy, int pageIndex, int maxRows, ref int totalRows);

        IList<MRoom> GetListByRoomType(Enums.EnumRoomType enumRoomType);
    }
}
