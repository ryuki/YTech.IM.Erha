using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;
using SharpArch.Core;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Web.NHibernate;
using YTech.IM.Erha.Core.Master;
using YTech.IM.Erha.Core.RepositoryInterfaces;
using YTech.IM.Erha.Enums;

namespace YTech.IM.Erha.Web.Controllers.ViewModel
{
    public class RegistrationFormViewModel
    {
        public static RegistrationFormViewModel CreateRegistrationFormViewModel(IMCustomerRepository mCustomerRepository, string customerId)
        {
            RegistrationFormViewModel viewModel = new RegistrationFormViewModel();
            viewModel.CanEditId = true;


            MCustomer customer = null;
            if (!string.IsNullOrEmpty(customerId))
            {
                customer = mCustomerRepository.Get(customerId);
                viewModel.CanEditId = false;
            }
            if (customer == null)
            {
                customer = new MCustomer();

                RefPerson person = new RefPerson();
                customer.PersonId = person;

                RefAddress address = new RefAddress();
                customer.AddressId = address;
            }
            viewModel.Customer = customer;

            //fill payment method
            var values = from EnumGender e in Enum.GetValues(typeof(EnumGender))
                         select new { ID = e, Name = e.ToString() };
            viewModel.GenderList = new SelectList(values, "Id", "Name");

            var letters = from EnumLetterTo e in Enum.GetValues(typeof(EnumLetterTo))
                          select new { ID = e, Name = e.ToString() };
            viewModel.LetterList = new SelectList(letters, "Id", "Name");

            var edus = from EnumEducation e in Enum.GetValues(typeof(EnumEducation))
                       select new { ID = e, Name = e.ToString() };
            viewModel.EducationList = new SelectList(edus, "Id", "Name");

            var merrieds = from EnumMarriedStatus e in Enum.GetValues(typeof(EnumMarriedStatus))
                           select new { ID = e, Name = e.ToString() };
            viewModel.MarriedStatusList = new SelectList(merrieds, "Id", "Name");
            return viewModel;
        }

        public MCustomer Customer { get; internal set; }
        public SelectList GenderList { get; internal set; }
        public SelectList LetterList { get; internal set; }
        public SelectList EducationList { get; internal set; }
        public SelectList MarriedStatusList { get; internal set; }
        public bool CanEditId { get; internal set; }


    }
}
