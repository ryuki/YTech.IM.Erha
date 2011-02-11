<%@ Page Language="C#" MasterPageFile="~/Views/Shared/MyMaster.master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<RegistrationFormViewModel>" %>

<asp:Content ContentPlaceHolderID="head" ID="headContent" runat="server">
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <% if (false)
       { %>
    <script src="../../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <% } %>
    <%-- <% using (Html.BeginForm())
   {%> --%>
    <% using (Ajax.BeginForm(new AjaxOptions
                                       {
                                           UpdateTargetId = "status",
                                           InsertionMode = InsertionMode.Replace,
                                           OnBegin = "ajaxValidate",
                                           OnSuccess = "onSavedSuccess",
                                           LoadingElementId = ""
                                       }

          ))
       {%>
    <div id="formArea">
        <%=Html.AntiForgeryToken()%>
        <table>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <label for="Id">
                                    No :</label>
                            </td>
                            <td>

                                <%--<%= Html.TextBox("Id",  Model.Customer.Id ?? string.Empty,new {@readonly= Model.CanEditId ? "true" : "false" })%>--%>

                                <%= Model.CanEditId ? Html.TextBox("Id",  Model.Customer.Id ?? string.Empty) : 
                                    Html.TextBox("Id",  Model.Customer.Id ?? string.Empty,new {@readonly= Model.CanEditId ? "true" : "false" })
                                    %>
                                <%= Html.ValidationMessage("Id")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonFirstName">
                                    Nama Lengkap
                                    <br />
                                    (Sesuai KTP/Passport) :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonFirstName", Model.Customer.PersonId.PersonFirstName)%>
                                <%= Html.ValidationMessage("PersonFirstName")%>
                                <%=Html.DropDownList("PersonGender",Model.GenderList,Model.Customer.PersonId.PersonGender)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonAnotherName">
                                    Nama Panggilan :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonAnotherName", Model.Customer.PersonId.PersonAnotherName)%>
                                <%= Html.ValidationMessage("PersonAnotherName")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonPob">
                                    Tempat / Tanggal Lahir :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonPob", Model.Customer.PersonId.PersonPob)%>
                                <%= Html.ValidationMessage("PersonPob")%>
                                &nbsp;/&nbsp;
                                <%= Html.TextBox("PersonDob", Model.Customer.PersonId.PersonDob.HasValue ? Model.Customer.PersonId.PersonDob.Value.ToString(CommonHelper.DateFormat):null)%>
                                <%= Html.ValidationMessage("PersonDob")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="AddressLine1">
                                    Alamat Rumah :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("AddressLine1", Model.Customer.AddressId.AddressLine1)%>
                                <%= Html.ValidationMessage("AddressLine1")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <%= Html.TextBox("AddressLine2", Model.Customer.AddressId.AddressLine2)%>
                                <%= Html.ValidationMessage("AddressLine2")%>
                                <label for="AddressRt">
                                    Rt. :</label>
                                <%= Html.TextBox("AddressRt", Model.Customer.AddressId.AddressRt, new { style = "width:20px" })%>
                                <%= Html.ValidationMessage("AddressRt")%>
                                <label for="AddressRw">
                                    Rw. :</label>
                                <%= Html.TextBox("AddressRw", Model.Customer.AddressId.AddressRw, new { style = "width:20px" })%>
                                <%= Html.ValidationMessage("AddressRw")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="AddressCity">
                                    Kota :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("AddressCity", Model.Customer.AddressId.AddressCity)%>
                                <%= Html.ValidationMessage("AddressCity")%>
                                <label for="AddressPostCode">
                                    Kode Pos :</label>
                                <%= Html.TextBox("AddressPostCode", Model.Customer.AddressId.AddressPostCode, new { style = "width:50px" })%>
                                <%= Html.ValidationMessage("AddressPostCode")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="AddressPhone">
                                    Telepon Rumah :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("AddressPhone", Model.Customer.AddressId.AddressPhone)%>
                                <%= Html.ValidationMessage("AddressPhone")%>
                                <label for="AddressFax">
                                    Fax :</label>
                                <%= Html.TextBox("AddressFax", Model.Customer.AddressId.AddressFax, new { style = "width:50px" })%>
                                <%= Html.ValidationMessage("AddressFax")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonMobile">
                                    HP :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonMobile", Model.Customer.PersonId.PersonMobile)%>
                                <%= Html.ValidationMessage("PersonMobile")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="AddressEmail">
                                    Email :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("AddressEmail", Model.Customer.AddressId.AddressEmail)%>
                                <%= Html.ValidationMessage("AddressEmail")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonJob">
                                    Pekerjaan :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonJob", Model.Customer.PersonId.PersonJob)%>
                                <%= Html.ValidationMessage("PersonJob")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonOfficceName">
                                    Nama perusahaan / kantor :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonOfficceName", Model.Customer.PersonId.PersonOfficceName)%>
                                <%= Html.ValidationMessage("PersonOfficceName")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonOfficceAddress">
                                    Alamat kantor :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonOfficceAddress", Model.Customer.PersonId.PersonOfficceAddress)%>
                                <%= Html.ValidationMessage("PersonOfficceAddress")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonOfficceCity">
                                    Kota :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonOfficceCity", Model.Customer.PersonId.PersonOfficceCity)%>
                                <%= Html.ValidationMessage("PersonOfficceCity")%>
                                <label for="PersonOfficcePostCode">
                                    Kode Pos :</label>
                                <%= Html.TextBox("PersonOfficcePostCode", Model.Customer.PersonId.PersonOfficcePostCode)%>
                                <%= Html.ValidationMessage("PersonOfficcePostCode")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonOfficcePhone">
                                    Telepon kantor :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonOfficcePhone", Model.Customer.PersonId.PersonOfficcePhone)%>
                                <%= Html.ValidationMessage("PersonOfficcePhone")%>
                                <label for="PersonOfficceFax">
                                    Fax :</label>
                                <%= Html.TextBox("PersonOfficceFax", Model.Customer.PersonId.PersonOfficceFax)%>
                                <%= Html.ValidationMessage("PersonOfficceFax")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="CustomerPhoneJakarta">
                                    Nama dan telepon yang dapat dihubungi di Jakarta :
                                    <br />
                                    (Khusus pasien luar Jakarta)
                                </label>
                            </td>
                            <td>
                                <%= Html.TextBox("CustomerPhoneJakarta", Model.Customer.CustomerPhoneJakarta)%>
                                <%= Html.ValidationMessage("CustomerPhoneJakarta")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="CustomerLetter">
                                    Bila ada surat maka akan dikirim ke :</label>
                            </td>
                            <td>
                                <%= Html.DropDownList("CustomerLetter",Model.LetterList, Model.Customer.CustomerLetter)%>
                                <%= Html.ValidationMessage("CustomerLetter")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonReligion">
                                    Agama :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonReligion", Model.Customer.PersonId.PersonReligion)%>
                                <%= Html.ValidationMessage("PersonReligion")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonLastEdu">
                                    Pendidikan Terakhir :</label>
                            </td>
                            <td>
                                <%= Html.DropDownList("PersonLastEdu", Model.EducationList, Model.Customer.PersonId.PersonLastEdu)%>
                                <%= Html.ValidationMessage("PersonLastEdu")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonMarriedStatus">
                                    Status Perkawinan :</label>
                            </td>
                            <td>
                                <%= Html.DropDownList("PersonMarriedStatus", Model.MarriedStatusList, Model.Customer.PersonId.PersonMarriedStatus)%>
                                <%= Html.ValidationMessage("PersonMarriedStatus")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="PersonHobby">
                                    Hobby :</label>
                            </td>
                            <td>
                                <%= Html.TextBox("PersonHobby", Model.Customer.PersonId.PersonHobby)%>
                                <%= Html.ValidationMessage("PersonHobby")%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="CustomerFaceTreatment">
                                    Perawatan muka yang sekarang dipakai :</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%= Html.TextArea("CustomerFaceTreatment", Model.Customer.CustomerFaceTreatment,5,100,null)%>
                                <%= Html.ValidationMessage("CustomerFaceTreatment")%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="CustomerAllergy">
                                    Riwayat alergi obat :</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%= Html.TextArea("CustomerAllergy", Model.Customer.CustomerAllergy, 5, 100, null)%>
                                <%= Html.ValidationMessage("CustomerAllergy")%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="CustomerSkinProblem">
                                    Riwayat masalah kulit sekarang :</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%= Html.TextArea("CustomerSkinProblem", Model.Customer.CustomerSkinProblem, 5, 100, null)%>
                                <%= Html.ValidationMessage("CustomerSkinProblem")%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="CustomerPlanTreatment">
                                    Rencana Pengobatan / Perawatan :</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <%= Html.TextArea("CustomerPlanTreatment", Model.Customer.CustomerPlanTreatment, 5, 100, null)%>
                                <%= Html.ValidationMessage("CustomerPlanTreatment")%>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <div>
                        <span id="toolbar" class="ui-widget-header ui-corner-all">
                        <%--<a id="newCustomer" href="Registration">
                            Registrasi Pasien Baru</a>--%>
                            <button id="Save" type="submit">
                                Simpan</button>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <div id="status">
                    </div>
                    <div class="ui-state-highlight ui-corner-all" style="padding: 5pt; margin-bottom: 5pt;
                        display: none;" id="error">
                        <p>
                            <span class="ui-icon ui-icon-error" style="float: left; margin-right: 0.3em;"></span>
                            <span id="error_msg"></span>.<br clear="all" />
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <%
        }
    %>
    <script language="javascript" type="text/javascript">
        function onSavedSuccess() {
            $("#Save").attr('disabled', 'disabled');
        }

        function ajaxValidate() {
            var errorimg = '<%= Url.Content("~/Content/Images/cross.gif") %>';
            var checkIdUrl = '<%= Url.Action("CheckCustomer","Customer") %>';
            return $('form').validate({
                rules: {
                    "Id": { required: true,
                        remote: {
                            url: checkIdUrl,
                            type: "post",
                            data: {
                                customerId: function () {
                                    return $("#Id").val();
                                }
                            }
                        }
                    },
                    "PersonFirstName": { required: true },
                    "AddressPhone": { required: true },
                    "PersonMobile": { required: true }
                },
                messages: {
                    "Id": { required: "<img id='Iderror' src='" + errorimg + "' hovertext='No Pasien harus diisi' />", remote: "<img id='remoteIderror' src='" + errorimg + "' hovertext='No Pasien sudah pernah diinput.' />" },
                    "PersonFirstName": "<img id='PersonFirstNameerror' src='" + errorimg + "' hovertext='Nama harus diisi' />",
                    "AddressPhone": "<img id='AddressPhoneerror' src='" + errorimg + "' hovertext='Telepon rumah harus diisi' />",
                    "PersonMobile": "<img id='PersonMobileerror' src='" + errorimg + "' hovertext='HP harus diisi' />"
                },
                invalidHandler: function (form, validator) {
                    var errors = validator.numberOfInvalids();
                    if (errors) {
                        var message = "Validasi data kurang";
                        //										var message = errors == 1
                        //					? 'You missed 1 field. It has been highlighted below'
                        //					: 'You missed ' + errors + ' fields.  They have been highlighted below';
                        $("div#error span#error_msg").html(message);
                        //				$("div#error").show();
                        $("div#error").dialog("open");
                        return false;
                    } else {
                        $("div#error").dialog("close");
                        //				$("div#error").hide();
                    }
                },
                errorPlacement: function (error, element) {
                    error.insertAfter(element);
                    //	generateTooltips();
                },
                //override default onfocusout of validation plugin
                onfocusout: function (element) {
                    if (!this.checkable(element) && (element.name in this.submitted || !this.optional(element))) {
                        this.element(element);
                    }
                }
            }).form();
        }


        $(function () {
            $("#newCustomer").button();
            $("#Save").button();
            $("#PersonDob").datepicker({ dateFormat: "dd-M-yy" });
        });

        $(document).ready(function () {
            $("form").mouseover(function () {
                generateTooltips();
            });


            $("#dialog").dialog({
                autoOpen: false
            });

            $("div#error").dialog({
                autoOpen: false
            });
        });


        //function to generate tooltips
        function generateTooltips() {
            //make sure tool tip is enabled for any new error label
            //          alert('s');
            $("img[id*='error']").tooltip({
                showURL: false,
                opacity: 0.99,
                fade: 150,
                positionRight: true,
                bodyHandler: function () {
                    return $("#" + this.id).attr("hovertext");
                }
            });
            //make sure tool tip is enabled for any new valid label
            $("img[src*='tick.gif']").tooltip({
                showURL: false,
                bodyHandler: function () {
                    return "OK";
                }
            });
        }
    </script>
</asp:Content>
