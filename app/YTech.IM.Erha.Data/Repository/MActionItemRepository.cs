using System;
using System.Collections.Generic;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;

namespace YTech.IM.Erha.Data.Repository
{
    public class MActionItemRepository : NHibernateRepositoryWithTypedId<MActionItem, string>, IMActionItemRepository
    {
        public IList<MActionItem> GetByActionId(string actionId)
        {
            StringBuilder sql = new StringBuilder();
            sql.AppendLine(@"   select ai
                                from MActionItem as ai");
            if (!string.IsNullOrEmpty(actionId))
            {
                sql.AppendLine(@" where ai.ActionId.Id = :actionId");
            }
            IQuery q = Session.CreateQuery(sql.ToString());
            if (!string.IsNullOrEmpty(actionId))
            {
                //MAction action = new MActionRepository().Get(actionId);
                q.SetString("actionId", actionId);
            }

            return q.List<MActionItem>();
        }
    }
}
