﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MyMaster.master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<BillingFormViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <% if (false)
       { %>
    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <% } %>
    <style type="text/css">
        .button_room
        {
            width: 90px;
            height: 65px;
            margin: 5px;
        }
        .used
        {
            font-weight: bold;
            background-color: Yellow;
            color: Blue;
        }
        .button_action
        {
            <%--width: 55px;
            height: 35px;
            margin: 3px;--%>
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <table>
       <tr>
            <td align="center" style="width: 95%;">
                <h2>
                    Ruangan</h2>
            </td>
        </tr>
        <tr>
            <td align="center">
                <% //if (Model.SpaManRoomList != null)
                    {
                        for (int i = 0; i < Model.RoomsList.Count; i++)
                        {
                            RoomViewModel room = Model.RoomsList[i];
                %>
                <input type="button" value='<%= room.RoomName %>&#13;&#10;<%= room.CustomerName %>' title='<%= room.RoomName %>' class="button_room <% if (room.RoomInUsed) { %>used<% } %>"
                    onclick="OpenRoomDetail('<%= room.Id %>','<%= room.RoomName %>');" id="btn_<%= room.Id %>" />
                <%
                    }
                    }
                %>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div id="detail_room">
        <table>
            <tr>
                <td>
                    <% using (Ajax.BeginForm(new AjaxOptions
                                       {
                                           //UpdateTargetId = "status",
                                           InsertionMode = InsertionMode.Replace,
                                           OnSuccess = "onSavedSuccess"
                                       }

          ))
                       {%>
                    <div id="status">
                    </div>
                    <%= Html.AntiForgeryToken() %>
                    <%= Html.Hidden("TransId", (ViewData.Model.Trans != null) ? ViewData.Model.Trans.Id : "")%>
                    <input id="HidIsVipRoom" type="hidden" />
                    <table>
                        <tr>
                            <td colspan="2" align="center">
                                <h1 id="ActiveRoom">
                                </h1>
                                <%= Html.Hidden("RoomId", (ViewData.Model.TransRoom.RoomId != null) ? ViewData.Model.TransRoom.RoomId.Id : "")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="TransBy">
                                    Pasien :</label>
                            </td>
                            <td nowrap="nowrap">
                                <%=Html.TextBox("TransBy", Model.Trans != null ? Model.Trans.TransBy : "", new {style="width:120px;"})%>
                                <img src='<%= Url.Content("~/Content/Images/window16.gif") %>' style='cursor: hand;'
                                    id='imgCustomerId' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input id="txtCustomerName" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="TransDate">
                                    Tanggal :</label>
                            </td>
                            <td>
                                <%=Html.TextBox("TransDate",
                                          Model.Trans.TransDate.HasValue
                                                                                                                      ? Model.Trans.TransDate.Value.ToString(CommonHelper.DateFormat)
                                              : null)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="RoomInDate">
                                    Jam Masuk :</label>
                            </td>
                            <td>
                                <%=Html.TextBox("RoomInDate",
                                          Model.TransRoom.RoomInDate.HasValue
                                              ? Model.TransRoom.RoomInDate.Value.ToString(CommonHelper.TimeFormat)
                                              : null)%>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <label for="TransRoom_RoomOutDate">
                                    Jam Keluar :</label>
                            </td>
                            <td>
                                <%=Html.TextBox("RoomOutDate",
                                          Model.TransRoom.RoomOutDate.HasValue
                                              ? Model.TransRoom.RoomOutDate.Value.ToString("HH:mm")
                                              : null)%>
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <label for="Duration">
                                    Durasi (JJ:MM) :</label>
                            </td>
                            <td>
                                <label id="Duration">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="SubTotal">
                                    Sub Total :</label>
                            </td>
                            <td align="right">
                                <label id="SubTotal">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="TransDiscount">
                                    Diskon(%) :</label>
                            </td>
                            <td>
                                <%=Html.TextBox("TransDiscount", Model.Trans.TransDiscount.HasValue != null ? Model.Trans.TransDiscount.Value.ToString() : "")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="GrandTotal">
                                    Total (Rp) :</label>
                            </td>
                            <td align="right">
                                <label id="GrandTotal">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="btnIn" name="btnIn" type="submit" value="Masuk" class="button_action" />&nbsp;
                                <input id="btnOut" name="btnOut" type="button" value="Keluar" class="button_action" />&nbsp;
                                <input id="btnCancel" name="btnCancel" type="submit" value="Batal" class="button_action" />&nbsp;
                                <input id="btnPrint" name="btnPrint" type="submit" value="Cetak" class="button_action" />&nbsp;
                                <input id="btnPaid" name="btnPaid" type="submit" value="Bayar" class="button_action" />&nbsp;
                            </td>
                        </tr>
                    </table>
                    <% Html.RenderPartial("Payment", Model); %>
                    <%
                        }%>
                </td>
                <td>
                    <div id="detail_list">
                        <table id="list" class="scroll" cellpadding="0" cellspacing="0">
                        </table>
                        <div id="listPager" class="scroll" style="text-align: center;">
                        </div>
                        <div id="listPsetcols" class="scroll" style="text-align: center;">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div>
        </div>
    </div>
    <div id='popup'>
        <iframe width='100%' height='100%' id="popup_frame" frameborder="0"></iframe>
    </div>
    <div id="dialog" title="Status">
        <p>
        </p>
    </div>
    <script language="javascript" type="text/javascript">
        function OpenRoomDetail(roomId,roomName) {
            $("#detail_room").dialog("open");
            $("#ActiveRoom").text(roomName);
            $("#RoomId").val(roomId); 
//            alert('debug 1');
            
            var troom = $.parseJSON($.ajax({ url: '<%= Url.Action("GetJsonTransRoom","Inventory") %>?roomId=' + roomId, async: false, cache: false, success: function (data, result) { if (!result) alert('Failure to retrieve the troom.'); } }).responseText);
            $("#TransId").val(troom.Id);
//            alert(troom.Id);
            if (troom.RoomInDate) {
                var dateIn = new Date(parseInt(troom.RoomInDate.substr(6)));
                var dateInTime = dateIn.format('HH:MM');
                $("#RoomInDate").val(dateInTime);
                //set duration
                var now = new Date();
                var minutes = Math.ceil( (now - dateIn)/1000/60);
                var durdate = new Date();
                durdate.setHours(minutes/60,minutes%60,0,0);
                $('#Duration').text(durdate.format('HH:MM'));
            }
            else {
                $("#RoomInDate").val('');
            }

            //get transaction date
            //alert('debug 1');
            if (troom.TransDate) {
            //alert('debug 2');
                var transDate = new Date(parseInt(troom.TransDate.substr(6)));
            //alert('debug 3');
                $("#TransDate").val(transDate.format('dd-mmm-yyyy'));
            //alert('debug 4');
                }
                else {
                 $("#TransDate").val('');
                }

                //save to temporaray hidden field for is vip room used
                $('#HidIsVipRoom').val(troom.IsVipRoom);
                
//           if (troom.RoomOutDate) {
//                var dateOut = new Date(parseInt(troom.RoomOutDate.substr(6)));
//                var dateOutTime = dateOut.format('HH:MM');
//                $("#RoomOutDate").val(dateOutTime);
//            }
//            else {
//                $("#RoomOutDate").val('');
//            }
//            alert('debug 2');

            if (troom.RoomStatus == 'New') {
                $("#detail_list").hide();
                $('#btnIn').attr('disabled', '');
                $('#btnOut').attr('disabled', 'disabled');
                $('#btnCancel').attr('disabled', 'disabled');  
                $('#btnPrint').attr('disabled', 'disabled');                     $("#imgCustomerId").click();
            }
            else if (troom.RoomStatus == 'In') {
                $("#detail_list").show();
                $('#btnIn').attr('disabled', 'disabled');
                $('#btnOut').attr('disabled', '');
                $('#btnCancel').attr('disabled', '');  
                $('#btnPrint').attr('disabled', 'disabled');     
            }
            else if (troom.RoomStatus == 'Paid') {
                $("#detail_list").show();
                $('#btnIn').attr('disabled', '');
                $('#btnOut').attr('disabled', 'disabled');
                $('#btnCancel').attr('disabled', 'disabled');  
                $('#btnPrint').attr('disabled', '');      
            }
//            alert('debug 3');
//              alert( $("#RoomId").val());
            $("#list").trigger("reloadGrid");
//              alert( $("#RoomId").val());

            //get trans
            var t = $.ajax({ url: '<%= Url.Action("GetJsonTrans","Inventory") %>?transId=' + troom.Id, async: false, cache: false, success: function (data, result) { if (!result) alert('Failure to retrieve the troom.'); } }).responseText;
//            alert(t);
             var trans = $.parseJSON(t);
//            alert('debug 4');
              $("#TransBy").val(trans.TransBy);
              $("#TransDiscount").val(trans.TransDiscount);
              $("#txtCustomerName").val(trans.CustomerName);
        }

        function onSavedSuccess(e)
        {
             var roomId =  $("#RoomId").val();
             var roomName =  $("#ActiveRoom").text();
             var json = e.get_response().get_object();
             var success = json.Success;
             if (success == false) {
                var msg = json.Message;
                if (msg) {

                if (msg == "redirect") {
    var urlreport = '<%= ResolveUrl("~/ReportViewer.aspx?rpt=RptPrintFacturServiceMini") %>';
//    alert(urlreport);
    window.open(urlreport);
}

//                $('#dialog p:first').text(msg);
//                $("#dialog").dialog("open"); 
                     return false ;  
                }
}
             var roomstatus = json.RoomStatus;
             if (roomstatus == 'In') {
            $('#btn_' + roomId).addClass('used');
            $("#detail_list").show("slow");
            $('#btnIn').attr('disabled', 'disabled');
            $('#btnOut').attr('disabled', '');
            $('#btnCancel').attr('disabled', '');
            $('#btnPrint').attr('disabled', 'disabled');
                var customerName = json.CustomerName;
            $('#btn_' + roomId).attr('value',roomName + '\n' + customerName);
}
           else if (roomstatus == 'Paid') { 
            $('#btn_' + roomId).removeClass('used');
            $('#btnIn').attr('disabled', 'disabled');
            $('#btnOut').attr('disabled', 'disabled');
            $('#btnCancel').attr('disabled', 'disabled');
            $('#btnPrint').attr('disabled', '');
            $('#btnPrint').click();
             $('#btn_' + roomId).val(roomName);
}
           else if (roomstatus == 'New') {
    $("#payment").dialog("close");
    $("#detail_room").dialog("close");
            $('#btn_' + roomId).removeClass('used');
             $('#btn_' + roomId).val(roomName);
}
        }
        
    function CalculateTotal() {
        var price = $('#TransDetPrice').val().replace(",","");
        var qty = $('#TransDetQty').val().replace(",","");
        var disc = $('#TransDetDisc').val().replace(",","");
        var subtotal = (price * qty)
        var total = subtotal - (disc * subtotal / 100);

        $('#TransDetTotal').attr('value', total);
    }

    function CalculatePaymentSisa()
    {
        var grandtotal = parseFloat($('#paymentGrandTotal').text().replace(",",""));
        var voucher = parseFloat($('#paymentVoucher').val().replace(",",""));
        var cash = parseFloat($('#paymentCash').val().replace(",",""));
        var creditcard = parseFloat($('#paymentCreditCard').val().replace(",",""));
        var totalpaid =  (voucher + cash + creditcard);
        //        alert(totalpaid);
        var sisa = totalpaid - grandtotal;
        $('#paymentSisa').text(FormatNumberBy3(sisa));
    }

        function GetTotal()
        {
            var total = $("td[aria-describedby='list_TransDetTotal']:last").text();
            //alert(total);
            $("#SubTotal").text(total);
            var subtotal = parseFloat(total.replace(",",""));
            //alert(subtotal);
            var discount = parseFloat($('#TransDiscount').val());
            //alert(discount);
            var grandtotal = subtotal - (subtotal * discount / 100);
            //alert(grandtotal);
             $("#GrandTotal").text(FormatNumberBy3(grandtotal));
        }

        $(document).ready(function () {
        $("#TransDate").datepicker({ dateFormat: "dd-M-yy" });
            $("#detail_list").hide();
                    $('#btnPaid').hide();
            $("#TransDiscount").autoNumeric();
            $("#TransDiscount").attr("style","text-align:right;");
            $("#paymentVoucher").autoNumeric();
            $("#paymentVoucher").attr("style","text-align:right;");
            $("#paymentCash").autoNumeric();
            $("#paymentCash").attr("style","text-align:right;");
            $("#paymentCreditCard").autoNumeric();
            $("#paymentCreditCard").attr("style","text-align:right;");
            
            $("#dialog").dialog({
                autoOpen: false
            });
            $("#payment").dialog({
                autoOpen: false,
                modal:true,
                title : "Pembayaran",
                 buttons: { 
                "OK": function() {
                    $(this).dialog("close");
                    $('#hidpaymentCash').val($('#paymentCash').val());
                    $('#hidpaymentVoucher').val($('#paymentVoucher').val());
                    $('#hidpaymentCreditCard').val($('#paymentCreditCard').val());
                    $('#btnPaid').click();
                },
                "Batal": function() { 
                    $(this).dialog("close");
                }
            }

            });
            $("#detail_room").dialog({
                autoOpen: false,
                modal:true,
                title:'Detail Transaksi',
                width:'900px',
                height: 380
            });
            $("#popup").dialog({
                autoOpen: false,
                height: 480,
                width: '80%',
                modal: true,
                close: function (event, ui) {
                    $("#list").trigger("reloadGrid");
                    GetTotal();
                }
            }); 
            $('#imgCustomerId').click(function(){
                OpenPopupCustomerSearch();
            }); 

//             $('#btnPrint').click(function(){
//                alert('print');
//            }); 

             $('#btnOut').click(function(){
                 $("#paymentSubTotal").text($("#SubTotal").text());
                 $("#hidPaymentSubTotal").val($("#SubTotal").text());
                 $("#paymentDiscount").text($("#TransDiscount").val());
                 $("#paymentGrandTotal").text($("#GrandTotal").text());
                
                 //set 0 for default for payment                 
                 $("#paymentVoucher").val(0);              
                 $("#paymentCash").val(0);              
                 $("#paymentCreditCard").val(0);
                 CalculatePaymentSisa();
               
                 $("#payment").dialog("open"); 
                 
                 $("#paymentVoucher").focus(); 

            });
                   
             $('#paymentVoucher').change(function(){
             CalculatePaymentSisa();
             }); 
                   
             $('#paymentCash').change(function(){
             CalculatePaymentSisa();
             });
                   
             $('#paymentCreditCard').change(function(){
             CalculatePaymentSisa();
              });  
                            
                    $('#TransDiscount').change(function () {
                        GetTotal();
                    });
//            $('#btnIn').click(function(){
//                $("#detail_list").show("slow");
//                $("#list").trigger("reloadGrid");
//                    $('#btnIn').attr('disabled', 'disabled');
//                    $('#btnOut').attr('disabled', '');
//                    $('#btnCancel').attr('disabled', '');
//            });

//              var editDialog = {
//            url: '<%= Url.Action("UpdateBill", "Inventory") %>'
//                , closeAfterAdd: true
//                , closeAfterEdit: true
//                , modal: true

//                , onclickSubmit: function (params) {
//                    var ajaxData = {};

//                    var list = $("#list");
//                    var selectedRow = list.getGridParam("selrow");
//                    rowData = list.getRowData(selectedRow);
//                    ajaxData = { Id: rowData.Id };

//                    return ajaxData;
//                }
//                , afterShowForm: function (eparams) {
//                    $('#Id').attr('disabled', 'disabled');
//                }
//                , width: "400"
//                , afterComplete: function (response, postdata, formid) {
//                    $('#dialog p:first').text(response.responseText);
//                    $("#dialog").dialog("open");
//                }
//        };
        var insertDialog = {
            url: '<%= Url.Action("InsertBill", "Inventory") %>' 
                , closeAfterAdd: true
                , closeAfterEdit: true
                , modal: true
                , afterShowForm: function (eparams) {
                    $('#Id').attr('disabled', '');
                    $('#TransDetQty').attr('value', '1'); 
                    $('#TransDetPrice').attr('value', '0');
                    $('#TransDetDisc').attr('value', '0');
                    $('#TransDetTotal').attr('value', '0'); 
                    $('#TransDetPrice').change(function () {
                        CalculateTotal();
                    });
                    $('#TransDetQty').change(function () {
                        CalculateTotal();
                    });
                    $('#TransDetDisc').change(function () {
                        CalculateTotal();
                    }); 
                     $('#imgActionId').click(function(){
                        OpenPopupActionSearch();
                        });
                     $('#imgDrId').click(function(){
                        OpenPopupEmployeeSearch("DrId");
                        });
                     $('#imgTherapistId').click(function(){
                        OpenPopupEmployeeSearch("TherapistId");
                        });
                     $('#imgMedicianId').click(function(){
                        OpenPopupEmployeeSearch("MedicianId");
                        });
                    
                }
                 , beforeSubmit: function (postdata, formid) { 
                    postdata.transId = $('#TransId').val();
                    return [true, ''];
                }
                , afterComplete: function (response, postdata, formid) {
                    $('#dialog p:first').text(response.responseText);
                    $("#dialog").dialog("open");

//                    //get packet id and qty base ajax
//                    var res = JSON.parse(response.responseText);
////                    alert(res);
//                    OpenPopupTransDetItem(res.Id,res.PacketId,res.TransDetQty);
                    GetTotal();
                }
                , width: "400"
                , recreateForm : true
        };
        var deleteDialog = {
            url: '<%= Url.Action("DeleteBill", "Inventory") %>'
                , modal: true
                , width: "400"
                , afterComplete: function (response, postdata, formid) {
                    $('#dialog p:first').text(response.responseText);
                    $("#dialog").dialog("open");
                    GetTotal();
                }
        };

        $.jgrid.nav.addtext = "Tambah";
        $.jgrid.nav.edittext = "Edit";
        $.jgrid.nav.deltext = "Hapus";
        $.jgrid.edit.addCaption = "Tambah Detail Baru";
        $.jgrid.edit.editCaption = "Edit Detail";
        $.jgrid.del.caption = "Hapus Detail";
        $.jgrid.del.msg = "Anda yakin menghapus Detail yang dipilih?";
        var imgLov = '<%= Url.Content("~/Content/Images/window16.gif") %>';
        $("#list").jqGrid({
            url: '<%= Url.Action("ListBill", "Inventory") %>', 
             postData: {
                    TransId: function () {   return $('#TransId').val(); }
                },
            datatype: 'json',
            mtype: 'GET',
            colNames: ['Id', 'Kode Tindakan', 'Nama Tindakan', 'Kuantitas', 'Harga', 
            'Diskon', 
            'Total', 'Kode Dokter', 'Nama Dokter', 'Kode Terapis', 'Nama Terapis', 'Kode Perawat', 'Nama Perawat'],
            colModel: [
                    { name: 'Id', index: 'Id', width: 100, align: 'left', key: true, editrules: { required: true, edithidden: false }, hidedlg: true, hidden: true, editable: false },
                    { name: 'ActionId', index: 'ActionId', width: 200, align: 'left', editable: true, edittype: 'text', editrules: {  required: true,edithidden: true }, hidden: true,
                       formoptions: {
                        "elmsuffix": "&nbsp;<img src='" + imgLov + "' style='cursor:hand;' id='imgActionId' />"
                    } 
                    }, 
                    { name: 'ActionName', index: 'ActionName', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { edithidden: true} },
                     { name: 'TransDetQty', index: 'TransDetQty', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: true  },
                       editoptions: {
                           dataInit: function (elem) {
                               $(elem).autoNumeric();
                               $(elem).attr("style","text-align:right;");
                           }
                       }
                        }, 
                   { name: 'TransDetPrice', index: 'TransDetPrice', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: true },
                       editoptions: {
                           dataInit: function (elem) {
                               $(elem).autoNumeric();
                               $(elem).attr("style","text-align:right;");
                           }
                       }
                        },
                   { name: 'TransDetDisc', index: 'TransDetDisc', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                       editoptions: {
                           dataInit: function (elem) {
                               $(elem).autoNumeric();
                               $(elem).attr("style","text-align:right;");
                           }
                       }
                        },
                   { name: 'TransDetTotal', index: 'TransDetTotal', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false } ,
                       editoptions: {
                           dataInit: function (elem) {
                               $(elem).autoNumeric();
                               $(elem).attr("style","text-align:right;");
                           }
                       }
                        }, 
               { name: 'DrId', index: 'DrId', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { required: false,edithidden: true }, hidden: true,
                       formoptions: {
                        "elmsuffix": "&nbsp;<img src='" + imgLov + "' style='cursor:hand;' id='imgDrId' />"
                    } }, 
                    { name: 'DrName', index: 'DrName', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { edithidden: true} }, 
               { name: 'TherapistId', index: 'TherapistId', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { required: false,edithidden: true }, hidden: true,
                       formoptions: {
                        "elmsuffix": "&nbsp;<img src='" + imgLov + "' style='cursor:hand;' id='imgTherapistId' />"
                    } }, 
                    { name: 'TherapistName', index: 'TherapistName', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { edithidden: true} }, 
               { name: 'MedicianId', index: 'MedicianId', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { required: false,edithidden: true }, hidden: true,
                       formoptions: {
                        "elmsuffix": "&nbsp;<img src='" + imgLov + "' style='cursor:hand;' id='imgMedicianId' />"
                    } }, 
                    { name: 'MedicianName', index: 'MedicianName', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { edithidden: true} }],

            pager: $('#listPager'),
            rowNum: -1,
            //              rowList: [20, 30, 50, 100],
            rownumbers: true,
            //              sortname: 'Id',
            //              sortorder: "asc",
            //              viewrecords: true,
            height: 200,
            caption: 'Daftar Detail', 
            width: 560,
            loadComplete: function () {
//                $('#list').setColProp('ItemId', { editoptions: { value: items} });
                $('#listPager_center').hide();
                    GetTotal();
            },
            ondblClickRow: function (rowid, iRow, iCol, e) {
                //$("#list").editGridRow(rowid, editDialog);
            }, footerrow: true, userDataOnFooter: true, altRows: true
        }).navGrid('#listPager',
                {
                    edit: false, add: true, del: true, search: false, refresh: true, view: false
                },
                null,
                insertDialog,
                deleteDialog
            );


            });
            
        function OpenPopupActionSearch()
        {
            $("#popup_frame").attr("src", "<%= ResolveUrl("~/Master/Action/Search") %>");
            $("#popup").dialog("open");
            return false;   
        }
            
        function OpenPopupCustomerSearch()
        {
            $("#popup_frame").attr("src", "<%= ResolveUrl("~/Master/Customer/Search") %>");
            $("#popup").dialog("open");
            return false;   
        }

        function OpenPopupItemSearch()
        {
            $("#popup_frame").attr("src", "<%= ResolveUrl("~/Master/Item/Search?Price=") %><%= EnumPrice.Sale.ToString() %>");
            $("#popup").dialog("open");
            return false;   
        }

        function OpenPopupEmployeeSearch(src)
        {
            $("#popup_frame").attr("src", "<%= ResolveUrl("~/Master/Employee/Search") %>?src="+src);
            $("#popup").dialog("open");
            return false;   
        }
        
         function SetCustomerDetail(customerId, customerName, customerServiceDisc)
        {
//        alert(itemId);
//        alert(itemName);
//        alert(price);
            $("#popup").dialog("close");
            $('#TransBy').attr('value', customerId);
            $('#txtCustomerName').attr('value', customerName); 
            $('#TransDiscount').attr('value', customerServiceDisc); 
       
        }

         function SetActionDetail(actionId, actionName, price)
        {
//        alert(itemId);
//        alert(itemName);
//        alert(price);
  $("#popup").dialog("close");
          $('#ActionId').attr('value', actionId);
          $('#ActionName').attr('value', actionName);
         $('#TransDetPrice').attr('value', price.toString());
            CalculateTotal();       
        }

         function SetEmployeeDetail(src,employeeId, employeeName)
        { 
            if (src == "DrId")
            {
        //alert(src);
             $('#DrId').attr('value', employeeId);
          $('#DrName').attr('value', employeeName);  
            }
            else if (src == "TherapistId")
            {
             $('#TherapistId').attr('value', employeeId);
          $('#TherapistName').attr('value', employeeName);

            }
            else if (src == "MedicianId")
            {
             $('#MedicianId').attr('value', employeeId);
          $('#MedicianName').attr('value', employeeName); 
            }
            $("#popup").dialog("close");
        }
        
            
        function OpenPopupTransDetItem(detailId,packetId,transDetQty)
        {
            var src = '<%= Url.Action("DetailItem", "Inventory") %>';
            src += '?detailId='+detailId+'&packetId='+packetId+'&transDetQty='+transDetQty;
            $("#popup_frame").attr("src", src);
            $("#popup").dialog("open");
            return false;   
        }

        function ClosePopUp()
        {
         $("#popup").dialog("close");
        }
    </script>
</asp:Content>
