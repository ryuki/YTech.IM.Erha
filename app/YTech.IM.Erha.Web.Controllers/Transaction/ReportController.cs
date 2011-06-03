﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;
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
using Microsoft.Reporting.WebForms;
using YTech.IM.Erha.Web.Controllers.ViewModel.Reports;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace YTech.IM.Erha.Web.Controllers.Transaction
{
    [HandleError]
    public class ReportController : Controller
    {
        //public ReportController()
        //    : this(new TJournalRepository(), new TJournalDetRepository(), new MCostCenterRepository(), new MAccountRepository(), new TRecAccountRepository(), new TRecPeriodRepository(), new MBrandRepository(), new MSupplierRepository(), new MWarehouseRepository(), new MItemRepository(), new TStockCardRepository(), new TStockItemRepository(), new TTransDetRepository())
        //{ }

        private readonly ITJournalRepository _tJournalRepository;
        private readonly ITJournalDetRepository _tJournalDetRepository;
        private readonly IMCostCenterRepository _mCostCenterRepository;
        private readonly IMAccountRepository _mAccountRepository;
        private readonly ITRecAccountRepository _tRecAccountRepository;
        private readonly ITRecPeriodRepository _tRecPeriodRepository;
        private readonly IMBrandRepository _mBrandRepository;
        private readonly IMSupplierRepository _mSupplierRepository;
        private readonly IMWarehouseRepository _mWarehouseRepository;
        private readonly IMItemRepository _mItemRepository;
        private readonly ITStockCardRepository _tStockCardRepository;
        private readonly ITStockItemRepository _tStockItemRepository;
        private readonly ITTransDetRepository _tTransDetRepository;
        private readonly ITTransRoomRepository _tTransRoomRepository;
        private readonly ITTransRepository _tTransRepository;
        private readonly ITCommissionRepository _tCommissionRepository;
        private readonly IMCustomerRepository _mCustomerRepository;

        public ReportController(ITJournalRepository tJournalRepository, ITJournalDetRepository tJournalDetRepository, IMCostCenterRepository mCostCenterRepository, IMAccountRepository mAccountRepository, ITRecAccountRepository tRecAccountRepository, ITRecPeriodRepository tRecPeriodRepository, IMBrandRepository mBrandRepository, IMSupplierRepository mSupplierRepository, IMWarehouseRepository mWarehouseRepository, IMItemRepository mItemRepository, ITStockCardRepository tStockCardRepository, ITStockItemRepository tStockItemRepository, ITTransDetRepository tTransDetRepository, ITTransRepository tTransRepository, ITTransRoomRepository tTransRoomRepository, ITCommissionRepository tCommissionRepository, IMCustomerRepository mCustomerRepository)
        {
            Check.Require(tJournalRepository != null, "tJournalRepository may not be null");
            Check.Require(tJournalDetRepository != null, "tJournalDetRepository may not be null");
            Check.Require(mCostCenterRepository != null, "mCostCenterRepository may not be null");
            Check.Require(mAccountRepository != null, "mAccountRepository may not be null");
            Check.Require(tRecAccountRepository != null, "tRecAccountRepository may not be null");
            Check.Require(tRecPeriodRepository != null, "tRecPeriodRepository may not be null");
            Check.Require(mBrandRepository != null, "mBrandRepository may not be null");
            Check.Require(mSupplierRepository != null, "mSupplierRepository may not be null");
            Check.Require(mWarehouseRepository != null, "mBrandRepository may not be null");
            Check.Require(mItemRepository != null, "mItemRepository may not be null");
            Check.Require(tStockCardRepository != null, "tStockCardRepository may not be null");
            Check.Require(tStockItemRepository != null, "tStockItemRepository may not be null");
            Check.Require(tTransDetRepository != null, "tTransDetRepository may not be null");
            Check.Require(tTransRepository != null, "tTransRepository may not be null");
            Check.Require(tTransRoomRepository != null, "tTransRoomRepository may not be null");
            Check.Require(tCommissionRepository != null, "tCommissionRepository may not be null");
            Check.Require(mCustomerRepository != null, "mCustomerRepository may not be null");


            this._tJournalRepository = tJournalRepository;
            this._tJournalDetRepository = tJournalDetRepository;
            this._mCostCenterRepository = mCostCenterRepository;
            this._mAccountRepository = mAccountRepository;
            this._tRecAccountRepository = tRecAccountRepository;
            this._tRecPeriodRepository = tRecPeriodRepository;
            this._mBrandRepository = mBrandRepository;
            this._mSupplierRepository = mSupplierRepository;
            this._mWarehouseRepository = mWarehouseRepository;
            this._mItemRepository = mItemRepository;
            this._tStockCardRepository = tStockCardRepository;
            this._tStockItemRepository = tStockItemRepository;
            this._tTransDetRepository = tTransDetRepository;
            this._tTransRepository = tTransRepository;
            this._tTransRoomRepository = tTransRoomRepository;
            this._tCommissionRepository = tCommissionRepository;
            this._mCustomerRepository = mCustomerRepository;
        }

        [Transaction]
        public ActionResult Report(EnumReports reports)
        {
            ReportParamViewModel viewModel = ReportParamViewModel.CreateReportParamViewModel(_mCostCenterRepository, _mWarehouseRepository, _mSupplierRepository, _tRecPeriodRepository, _mItemRepository);
            string title = string.Empty;
            switch (reports)
            {
                case EnumReports.RptBrand:
                    title = "Daftar Master Merek";

                    break;
                case EnumReports.RptCostCenter:
                    title = "Daftar Master Cost Center";
                    break;
                case EnumReports.RptJournal:
                    title = "Daftar Jurnal";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    viewModel.ShowCostCenter = true;
                    break;
                case EnumReports.RptNeraca:
                    title = "Laporan Neraca";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    viewModel.ShowCostCenter = true;
                    break;
                case EnumReports.RptLR:
                    title = "Laporan Laba / Rugi";
                    viewModel.ShowCostCenter = true;
                    viewModel.ShowRecPeriod = true;
                    break;
                case EnumReports.RptStockCard:
                    title = "Kartu Stok";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    viewModel.ShowItem = true;
                    viewModel.ShowWarehouse = true;
                    break;
                case EnumReports.RptStockItem:
                    title = "Lap. Stok Per Gudang";
                    viewModel.ShowItem = true;
                    viewModel.ShowWarehouse = true;
                    break;
                case EnumReports.RptAnalyzeBudgetDetail:
                    title = "Lap. Analisa Budget";
                    viewModel.ShowItem = true;
                    viewModel.ShowWarehouse = true;
                    break;
                case EnumReports.RptServiceOmzet:
                    title = "Lap. Omzet Penjualan";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    break;
                case EnumReports.RptCommission:
                    title = "Lap. Komisi Karyawan";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    break;
                case EnumReports.RptSalesByAction:
                    title = "Lap. Penjualan Berdasar Jlh Tindakan";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    break;
                case EnumReports.RptBukuBesar:
                    title = "Laporan Buku Besar";
                    viewModel.ShowDateFrom = true;
                    viewModel.ShowDateTo = true;
                    viewModel.ShowCostCenter = true;
                    break;
            }
            ViewData["CurrentItem"] = title;


            ViewData["ExportFormat"] = new SelectList(Enum.GetValues(typeof(EnumExportFormat)));

            return View(viewModel);
        }


        [ValidateAntiForgeryToken]      // Helps avoid CSRF attacks
        [Transaction]                   // Wraps a transaction around the action
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Report(EnumReports reports, ReportParamViewModel viewModel, FormCollection formCollection)
        {
            ReportDataSource[] repCol = new ReportDataSource[1];
            switch (reports)
            {
                case EnumReports.RptBrand:
                    repCol[0] = GetBrand();
                    break;
                case EnumReports.RptCostCenter:
                    repCol[0] = GetCostCenter();
                    break;
                case EnumReports.RptJournal:
                    repCol[0] = GetJournalDet(viewModel.DateFrom, viewModel.DateTo, viewModel.CostCenterId);
                    break;
                case EnumReports.RptNeraca:
                    repCol[0] = GetRecAccount(EnumAccountCatType.NERACA, viewModel.CostCenterId, viewModel.RecPeriodId);
                    break;
                case EnumReports.RptLR:
                    repCol[0] = GetRecAccount(EnumAccountCatType.LR, viewModel.CostCenterId, viewModel.RecPeriodId);
                    break;
                case EnumReports.RptStockCard:
                    repCol[0] = GetStockCard(viewModel.DateFrom, viewModel.DateTo, viewModel.ItemId, viewModel.WarehouseId);
                    break;
                case EnumReports.RptStockItem:
                    repCol[0] = GetStockItem(viewModel.ItemId, viewModel.WarehouseId);
                    break;
                case EnumReports.RptAnalyzeBudgetDetail:
                    repCol[0] = GetTransDetForBudget(viewModel.ItemId, viewModel.WarehouseId);
                    break;
                case EnumReports.RptPrintFacturService:
                    repCol = new ReportDataSource[3];
                    TTrans trans = _tTransRepository.Get(viewModel.TransId);
                    repCol[0] = GetTrans(trans);
                    repCol[1] = GetTransDet(trans.TransDets);
                    repCol[2] = GetTransRoom(viewModel.TransId);
                    break;
                case EnumReports.RptServiceOmzet:
                    repCol[0] = GetServiceOmzet(viewModel.DateFrom.Value, viewModel.DateTo.Value);
                    break;
                case EnumReports.RptCommission:
                    repCol[0] = GetCommission(viewModel.DateFrom.Value, viewModel.DateTo.Value);
                    break;
                case EnumReports.RptSalesByAction:
                    repCol[0] = GetTransDetForTotalAction(viewModel.DateFrom.Value, viewModel.DateTo.Value);
                    break;
                case EnumReports.RptBukuBesar:
                    repCol[0] = GetJournalDet(viewModel.DateFrom, viewModel.DateTo, viewModel.CostCenterId);
                    break;
            }
            Session["ReportData"] = repCol;

            var e = new
                        {
                            Success = true,
                            Message = "redirect",
                            UrlReport = string.Format("{0}", reports.ToString())
                        };
            return Json(e, JsonRequestBehavior.AllowGet);
        }

        private ReportDataSource GetTransDetForTotalAction(DateTime dateFrom, DateTime dateTo)
        {
            IList<TTransDet> dets = _tTransDetRepository.GetListByDate(dateFrom, dateTo, EnumTransactionStatus.Service);

            var list = from det in dets
                       select new
                       {
                           det.Id,
                           det.TransDetNo,
                           det.TransDetQty,
                           det.TransDetDesc,
                           det.TransDetTotal,
                           det.TransDetPrice,
                           det.TransDetDisc,
                           ActionId = det.ActionId.Id,
                           det.ActionId.ActionName,
                           det.TransId.TransDate
                       }
            ;

            ReportDataSource reportDataSource = new ReportDataSource("TransDetViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetCommission(DateTime dateFrom, DateTime dateTo)
        {
            IList<TCommission> listComms = _tCommissionRepository.GetByTransDate(dateFrom, dateTo);
            var listViewModel = from t in listComms
                                select new
                                {
                                    t.CommissionValue,
                                    t.TransDetId.ActionId.ActionName,
                                    EmployeeId = t.EmployeeId.Id,
                                    EmployeeName = t.EmployeeId.PersonId.PersonName,
                                    t.TransDetId.TransId.TransDate,
                                    t.TransDetId.TransId.TransFactur,
                                    t.TransDetId.TransDetQty,
                                    t.TransDetId.TransDetTotal
                                }
    ;
            ReportDataSource reportDataSource = new ReportDataSource("CommissionViewModel", listViewModel.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetServiceOmzet(DateTime dateFrom, DateTime dateTo)
        {
            IList<TTransRoom> listTransroom = _tTransRoomRepository.GetListByTransDate(dateFrom, dateTo, EnumTransRoomStatus.Paid);
            var listRoom = from t in listTransroom
                           select new
                           {
                               t.RoomVoucherPaid,
                               t.RoomCashPaid,
                               t.RoomCreditPaid,
                               t.RoomDesc,
                               t.RoomInDate,
                               t.RoomOutDate,
                               t.RoomStatus,
                               t.TransId.TransFactur,
                               t.TransId.TransSubTotal,
                               t.TransId.TransDiscount,
                               t.TransId.TransDate,
                               t.TransId.TransGrandTotal,
                               CustomerName = Helper.CommonHelper.GetCustomerName(_mCustomerRepository, t.TransId.TransBy)
                           }
      ;
            ReportDataSource reportDataSource = new ReportDataSource("TransRoomViewModel", listRoom.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetTransRoom(string TransId)
        {
            TTransRoom troom = _tTransRoomRepository.Get(TransId);
            IList<TTransRoom> listTransroom = new List<TTransRoom>();
            listTransroom.Add(troom);
            var listRoom = from det in listTransroom
                           select new
                           {
                               det.RoomId.Id,
                               det.RoomInDate,
                               det.RoomOutDate,
                               det.RoomStatus,
                               det.RoomVoucherPaid,
                               det.RoomCashPaid,
                               det.RoomCreditPaid,
                               det.RoomCommissionProduct,
                               det.RoomCommissionService
                           }
      ;
            ReportDataSource reportDataSource = new ReportDataSource("TransRoomViewModel", listRoom.ToList());
            return reportDataSource;
        }

        private static ReportDataSource GetTransDet(IList<TTransDet> transDets)
        {
            var listDet = from det in transDets
                          select new
                          {
                              //det.PacketId,
                              EmployeeId = det.EmployeeId.Id,
                              EmployeeName = det.EmployeeId.PersonId.PersonName,
                              PacketId = det.ActionId.Id,
                              det.ActionId.ActionName,
                              det.TransDetPrice,
                              det.TransDetQty,
                              det.TransDetDisc,
                              TransDetCommissionProduct = 0,
                              TransDetCommissionService = 0,
                              det.TransDetNo,
                              det.TransDetTotal
                          }
      ;
            ReportDataSource reportDataSource = new ReportDataSource("TransDetViewModel", listDet.ToList());
            return reportDataSource;
        }

        private static ReportDataSource GetTrans(TTrans trans)
        {
            IList<TTrans> listTrans = new List<TTrans>();
            listTrans.Add(trans);
            var list = from det in listTrans
                       select new
                       {
                           det.TransFactur,
                           det.TransDate,
                           det.TransSubTotal,
                           det.TransBy,
                           det.TransDesc,
                           det.TransDiscount,
                           det.TransStatus,
                           EmployeeId = det.EmployeeId.Id,
                           EmployeeName = det.EmployeeId.PersonId.PersonName
                       }
       ;
            ReportDataSource reportDataSource = new ReportDataSource("TransViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetTransDetForBudget(string itemId, string warehouseId)
        {
            IList<TTransDet> dets;
            MItem item = null;
            MWarehouse warehouse = null;
            if (!string.IsNullOrEmpty(itemId))
                item = _mItemRepository.Get(itemId);
            if (!string.IsNullOrEmpty(warehouseId))
                warehouse = _mWarehouseRepository.Get(warehouseId);
            dets = _tTransDetRepository.GetByItemWarehouse(item, warehouse);

            var list = from det in dets
                       select new
                                  {
                                      det.TransDetNo,
                                      det.TransDetQty,
                                      det.TransDetDesc,
                                      det.TransDetTotal,
                                      det.TransDetPrice,
                                      det.TransDetDisc,
                                      ItemId = det.ItemId.Id,
                                      det.ItemId.ItemName,
                                      WarehouseId = det.TransId.WarehouseId.Id,
                                      det.TransId.WarehouseId.WarehouseName,
                                      TotalUsed = _tTransDetRepository.GetTotalUsed(det.ItemId, det.TransId.WarehouseId)
                                  }
            ;

            ReportDataSource reportDataSource = new ReportDataSource("TransDetViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetStockItem(string itemId, string warehouseId)
        {
            IList<TStockItem> stockItems;
            MItem item = null;
            MWarehouse warehouse = null;
            if (!string.IsNullOrEmpty(itemId))
                item = _mItemRepository.Get(itemId);
            if (!string.IsNullOrEmpty(warehouseId))
                warehouse = _mWarehouseRepository.Get(warehouseId);
            stockItems = _tStockItemRepository.GetByItemWarehouse(item, warehouse);

            var list = from stock in stockItems
                       select new
                       {
                           stock.ItemStock,
                           stock.ItemStockMax,
                           stock.ItemStockMin,
                           ItemId = stock.ItemId.Id,
                           stock.ItemId.ItemName,
                           WarehouseId = stock.WarehouseId.Id,
                           stock.WarehouseId.WarehouseName,
                           stock.ItemStockRack
                       }
             ;
            //return list.ToList();
            ReportDataSource reportDataSource = new ReportDataSource("StockItemViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetStockCard(DateTime? dateFrom, DateTime? dateTo, string itemId, string warehouseId)
        {
            IList<TStockCard> cards;
            MItem item = null;
            MWarehouse warehouse = null;
            if (!string.IsNullOrEmpty(itemId))
                item = _mItemRepository.Get(itemId);
            if (!string.IsNullOrEmpty(warehouseId))
                warehouse = _mWarehouseRepository.Get(warehouseId);
            cards = _tStockCardRepository.GetByDateItemWarehouse(dateFrom, dateTo, item, warehouse);

            var list = from card in cards
                       select new
                       {
                           card.StockCardQty,
                           card.StockCardDate,
                           card.StockCardStatus,
                           ItemId = card.ItemId.Id,
                           card.ItemId.ItemName,
                           WarehouseId = card.WarehouseId.Id,
                           card.WarehouseId.WarehouseName,
                           card.StockCardSaldo,
                           card.StockCardDesc
                       }
            ;

            ReportDataSource reportDataSource = new ReportDataSource("StockCardViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetRecAccount(EnumAccountCatType accountCatType, string costCenterId, string recPeriodId)
        {
            IList<TRecAccount> dets;
            TRecPeriod recPeriod = _tRecPeriodRepository.Get(recPeriodId);
            if (!string.IsNullOrEmpty(costCenterId))
            {
                MCostCenter costCenter = _mCostCenterRepository.Get(costCenterId);
                dets = _tRecAccountRepository.GetByAccountType(accountCatType.ToString(), costCenter, recPeriod);
            }
            else
            {
                dets = _tRecAccountRepository.GetByAccountType(accountCatType.ToString(), null, recPeriod);
            }

            var list = from det in dets
                       select new
                       {
                           det.RecAccountStart,
                           det.RecAccountEnd,
                           det.RecAccountDesc,
                           CostCenterId = det.CostCenterId.Id,
                           det.CostCenterId.CostCenterName,
                           AccountId = det.AccountId.Id,
                           det.AccountId.AccountName,
                           AccountCatId = det.AccountId.AccountCatId.Id,
                           det.AccountId.AccountCatId.AccountCatName,
                           AccountParentId = det.AccountId.AccountParentId != null ? det.AccountId.AccountParentId.Id : ""
                       }
            ;

            ReportDataSource reportDataSource = new ReportDataSource("RecAccountViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetJournalDet(DateTime? dateFrom, DateTime? dateTo, string costCenterId)
        {
            IList<TJournalDet> dets;
            if (!string.IsNullOrEmpty(costCenterId))
            {
                MCostCenter costCenter = _mCostCenterRepository.Get(costCenterId);
                dets = _tJournalDetRepository.GetForReport(dateFrom, dateTo, costCenter);
            }
            else
            {
                dets = _tJournalDetRepository.GetForReport(dateFrom, dateTo, null);
            }

            var list = from det in dets
                       select new
                                  {
                                      det.JournalDetAmmount,
                                      det.JournalDetStatus,
                                      det.JournalDetDesc,
                                      det.JournalDetEvidenceNo,
                                      det.JournalId.JournalVoucherNo,
                                      CostCenterId = det.JournalId.CostCenterId.Id,
                                      det.JournalId.CostCenterId.CostCenterName,
                                      det.JournalId.JournalDate,
                                      AccountId = det.AccountId.Id,
                                      det.AccountId.AccountName
                                  }
            ;

            ReportDataSource reportDataSource = new ReportDataSource("JournalDetViewModel", list.ToList());
            return reportDataSource;
        }

        private ReportDataSource GetCostCenter()
        {
            ReportDataSource reportDataSource = new ReportDataSource("CostCenter", _mCostCenterRepository.GetAll());
            return reportDataSource;
        }

        private ReportDataSource GetBrand()
        {
            //  var list = from brand in _mBrandRepository.GetAll()
            //             select new
            //             {
            //                 brand.Id,
            //                 brand.BrandName,
            //                 brand.BrandDesc,
            //                 brand.DataStatus,
            //                 brand.CreatedBy,
            //                 brand.CreatedDate,
            //                 brand.ModifiedBy,
            //                 brand.ModifiedDate
            //             }
            //;
            ReportDataSource reportDataSource = new ReportDataSource("Brand", _mBrandRepository.GetAll());
            return reportDataSource;
        }

    }
}
