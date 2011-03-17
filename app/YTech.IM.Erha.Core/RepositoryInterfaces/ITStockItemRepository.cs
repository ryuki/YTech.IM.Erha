using System.Collections.Generic;
using SharpArch.Core.PersistenceSupport.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Inventory;

namespace YTech.IM.Erha.Core.RepositoryInterfaces
{
    public interface ITStockItemRepository : INHibernateRepositoryWithTypedId<TStockItem, string>
    {
        TStockItem GetByItemAndWarehouse(MItem mItem, MWarehouse mWarehouse);

        IList<TStockItem> GetByItemWarehouse(MItem item, MWarehouse warehouse);
    }
}
