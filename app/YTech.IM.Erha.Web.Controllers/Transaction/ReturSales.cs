﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Reporting.WebForms;
using SharpArch.Core;
using SharpArch.Web.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction.Accounting;
using YTech.IM.Erha.Core.Transaction.Inventory;
using YTech.IM.Erha.Data.Repository;
using YTech.IM.Erha.Enums;
using YTech.IM.Erha.Web.Controllers.ViewModel;

namespace YTech.IM.Erha.Web.Controllers.Transaction
{
    public class ReturSales : AbstractTransaction
    {
        #region Overrides of AbstractTransaction

        public override void SaveJournal(TTrans trans, decimal totalHPP)
        {
            //string desc = string.Format("Retur Penjualan barang dari {0}", trans.TransBy);
            //string newVoucher = Helper.CommonHelper.GetVoucherNo(false);
            ////save header of journal
            //TJournal journal = SaveJournalHeader(newVoucher, trans, desc);
            //MAccountRef accountRef = null;

            ////save retur penjualan
            //SaveJournalDet(journal, newVoucher, Helper.AccountHelper.GetReturSalesAccount(), EnumJournalStatus.D, trans.TransGrandTotal.Value, trans, desc);
            //if (trans.TransPaymentMethod == EnumPaymentMethod.Tunai.ToString())
            //{
            //    //save cash
            //    SaveJournalDet(journal, newVoucher, Helper.AccountHelper.GetCashAccount(), EnumJournalStatus.K, trans.TransGrandTotal.Value, trans, desc);
            //}
            //else
            //{
            //    accountRef = AccountRefRepository.GetByRefTableId(EnumReferenceTable.Customer, trans.TransBy);
            //    //save piutang
            //    SaveJournalDet(journal, newVoucher, accountRef.AccountId, EnumJournalStatus.K, trans.TransGrandTotal.Value, trans, desc);
            //}

            ////save persediaan
            //accountRef = AccountRefRepository.GetByRefTableId(EnumReferenceTable.Warehouse, trans.WarehouseId.Id);
            //SaveJournalDet(journal, newVoucher, accountRef.AccountId, EnumJournalStatus.D, totalHPP, trans, desc);

            ////save ikhtiar LR
            //SaveJournalDet(journal, newVoucher, Helper.AccountHelper.GetIkhtiarLRAccount(), EnumJournalStatus.K, totalHPP, trans, desc);

            //JournalRepository.Save(journal);
        }

        #endregion
    }
}
