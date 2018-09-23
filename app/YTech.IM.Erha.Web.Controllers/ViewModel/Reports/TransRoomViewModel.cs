using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YTech.IM.Erha.Core.Transaction;

namespace YTech.IM.Erha.Web.Controllers.ViewModel.Reports
{
    public class TransRoomViewModel : TTransRoom
    {
        public decimal? TransSubTotal { get; set; }
        public decimal? TransDiscount { get; set; }
        public DateTime? TransDate { get; set; }
        public string TransFactur { get; set; }
        public decimal? TransGrandTotal { get; set; }
        public string CustomerName { get; set; }

        public string TransBy { get; set; }
    }
}
