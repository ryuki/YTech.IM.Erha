using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Accounting;
using YTech.IM.Erha.Core.Transaction.Inventory;

namespace YTech.IM.Erha.Web.Controllers.ViewModel.Reports
{
    public class TransDetViewModel : TTransDet
    {
        public string ItemName { get; set; }
        public decimal TotalUsed { get; set; }
        public string WarehouseId { get; set; }
        public string WarehouseName { get; set; }
        public string ActionName { get; set; }
        public string EmployeeName { get; set; }
        public string DoctorName { get; set;  }
        public string TherapistName { get; set;  }
        public string MedicianName { get; set; }
        public DateTime TransDate { get; set; }


        public decimal? TransSubTotal { get; set; }
        public decimal? TransDiscount { get; set; }
        public string TransFactur { get; set; }
        public decimal? TransGrandTotal { get; set; }
        public string CustomerName { get; set; }
        public string TransDesc { get; set; }
    }
}
