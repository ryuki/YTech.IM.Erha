﻿using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class MAccountCatRepository : NHibernateRepositoryWithTypedId<MAccountCat, string>, IMAccountCatRepository
    {
    }
}
