using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
   public interface IMItemUomRepository : INHibernateRepositoryWithTypedId<MItemUom, string>
   {
       MItemUom GetByItem(MItem item);
   }
}
