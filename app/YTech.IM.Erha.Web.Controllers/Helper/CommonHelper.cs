﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
//using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Core.Transaction;
using YTech.IM.Erha.Enums;
using YTech.IM.Erha.Data.Repository;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Core;

namespace YTech.IM.Erha.Web.Controllers.Helper
{
    public class CommonHelper
    {
        public static string DateFormat
        {
            get { return "dd-MMM-yyyy"; }
        }
        public static string DateTimeFormat
        {
            get { return "dd-MMM-yyyy HH24:mm"; }
        }
        public static string NumberFormat
        {
            get { return "N2"; }
        }
        public static string IntegerFormat
        {
            get { return "N0"; }
        }

        /// <summary>
        /// Will get the string value for a given enums value, this will
        /// only work if you assign the StringValue attribute to
        /// the items in your enum.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetStringValue(Enum value)
        {
            // Get the type
            Type type = value.GetType();

            // Get fieldinfo for this type
            FieldInfo fieldInfo = type.GetField(value.ToString());

            // Get the stringvalue attributes
            StringValueAttribute[] attribs = fieldInfo.GetCustomAttributes(
                typeof(StringValueAttribute), false) as StringValueAttribute[];

            // Return the first if there was a match.
            return attribs.Length > 0 ? attribs[0].StringValue : value.ToString();
        }

         public static TReference GetReference(EnumReferenceType referenceType)
        {
            ITReferenceRepository referenceRepository = new TReferenceRepository();
            TReference reference = referenceRepository.GetByReferenceType(referenceType);
            if (reference == null)
            {
                reference = new TReference();
                reference.SetAssignedIdTo(Guid.NewGuid().ToString());
                reference.ReferenceType = referenceType.ToString();
                reference.ReferenceValue = "0";
                reference.CreatedDate = DateTime.Now;
                reference.DataStatus = EnumDataStatus.New.ToString();
                referenceRepository.Save(reference);
                referenceRepository.DbContext.CommitChanges();
            }
            return reference;
        }

        public static string GetFacturNo(EnumTransactionStatus transactionStatus)
        {
            TReference refer = GetReference((EnumReferenceType)Enum.Parse(typeof(EnumReferenceType), transactionStatus.ToString()));
            ITReferenceRepository referenceRepository = new TReferenceRepository();
            decimal no = Convert.ToDecimal(refer.ReferenceValue) + 1;
            refer.ReferenceValue = no.ToString();
            referenceRepository.Update(refer);
            referenceRepository.DbContext.CommitChanges();

            string tipeTrans = string.Empty;
            char[] charTransArray = transactionStatus.ToString().ToCharArray();
            char charTrans;

            for (int i = 0; i < transactionStatus.ToString().Length; i++)
            {
                charTrans = charTransArray[i];
                if (char.IsUpper(transactionStatus.ToString(), i))
                    tipeTrans += transactionStatus.ToString().Substring(i, 1);
            }
            string formatFactur = "Erha/[TRANS]/[XXX]/[MONTH]/[YEAR]";
            StringBuilder result = new StringBuilder();
            result.Append(formatFactur);
            result.Replace("[TRANS]", tipeTrans);
            result.Replace("[XXX]", GetFactur(5, no));
            result.Replace("[MONTH]", DateTime.Today.ToString("MMM").ToUpper());
            result.Replace("[YEAR]", DateTime.Now.Year.ToString());
            return result.ToString();
        }

        public static string GetVoucherNo()
        {
            TReference refer = GetReference(EnumReferenceType.VoucherNo);
            ITReferenceRepository referenceRepository = new TReferenceRepository();
            decimal no = Convert.ToDecimal(refer.ReferenceValue) + 1;
            refer.ReferenceValue = no.ToString();
            referenceRepository.Update(refer);
            referenceRepository.DbContext.CommitChanges();

            string formatFactur = "Erha/[XXX]/[MONTH]/[YEAR]";
            StringBuilder result = new StringBuilder();
            result.Append(formatFactur);
            result.Replace("[XXX]", GetFactur(5, no));
            result.Replace("[MONTH]", DateTime.Today.ToString("MMM").ToUpper());
            result.Replace("[YEAR]", DateTime.Now.Year.ToString());
            return result.ToString();
        }

        private static string GetFactur(int maxLength, decimal no)
        {
            int len = maxLength - no.ToString().Length;
            string factur = no.ToString();
            for (int i = 0; i < len; i++)
            {
                factur = "0" + factur;
            }
            return factur;
        }

        public static string GetEnumListForGrid<T>(string defaultText)
        {
            if (!typeof(T).IsEnum)
            {
                throw new Exception("Type object must enum");
            }
            var lists = from T e in Enum.GetValues(typeof(T))
                        select new { ID = e, Name = e.ToString() };
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("{0}:{1};", string.Empty, defaultText);

            for (int i = 0; i < lists.Count(); i++)
            {
                var obj = lists.ElementAt(i);
                sb.AppendFormat("{0}:{1}", obj.ID, obj.Name);
                if (i < lists.Count() - 1)
                    sb.Append(";");
            }
            return (sb.ToString());
        }



    }
}
