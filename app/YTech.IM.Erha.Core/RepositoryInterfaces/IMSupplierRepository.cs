﻿using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface IMSupplierRepository : INHibernateRepositoryWithTypedId<MSupplier, string>
    {
        IEnumerable<MSupplier> GetPagedSupplierList(string orderCol,string orderBy,int pageIndex,int maxRows,ref int totalRows);

    }
}
