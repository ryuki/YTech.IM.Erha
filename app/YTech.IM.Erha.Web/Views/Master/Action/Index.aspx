<%@ Page Language="C#" MasterPageFile="~/Views/Shared/MyMaster.master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <table id="list" class="scroll" cellpadding="0" cellspacing="0">
    </table>
    <div id="listPager" class="scroll" style="text-align: center;">
    </div>
    <div id="listPsetcols" class="scroll" style="text-align: center;">
    </div>
    <div id="dialog" title="Status">
        <p>
        </p>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#dialog").dialog({
                autoOpen: false
            });

            var editDialog = {
                url: '<%= Url.Action("Update", "Action") %>'
                , closeAfterAdd: true
                , closeAfterEdit: true
                , modal: true

                , onclickSubmit: function (params) {
                    var ajaxData = {};

                    var list = $("#list");
                    var selectedRow = list.getGridParam("selrow");
                    rowData = list.getRowData(selectedRow);
                    ajaxData = { Id: rowData.Id };

                    return ajaxData;
                }
                , afterShowForm: function (eparams) {
                    $('#Id').attr('disabled', 'disabled');
                }
                , width: "400"
                , afterComplete: function (response, postdata, formid) {
                    $('#dialog p:first').text(response.responseText);
                    $("#dialog").dialog("open");
                }
            };
            var insertDialog = {
                url: '<%= Url.Action("Insert", "Action") %>'
                , closeAfterAdd: true
                , closeAfterEdit: true
                , modal: true
                , afterShowForm: function (eparams) {
                    $('#Id').attr('disabled', '');

                }
                , afterComplete: function (response, postdata, formid) {
                    $('#dialog p:first').text(response.responseText);
                    $("#dialog").dialog("open");
                }
                , width: "400"
            };
            var deleteDialog = {
                url: '<%= Url.Action("Delete", "Action") %>'
                , modal: true
                , width: "400"
                , afterComplete: function (response, postdata, formid) {
                    $('#dialog p:first').text(response.responseText);
                    $("#dialog").dialog("open");
                }
            };

            $.jgrid.nav.addtext = "Tambah";
            $.jgrid.nav.edittext = "Edit";
            $.jgrid.nav.deltext = "Hapus";
            $.jgrid.edit.addCaption = "Tambah Tindakan Baru";
            $.jgrid.edit.editCaption = "Edit Tindakan";
            $.jgrid.del.caption = "Hapus Produk";
            $.jgrid.del.msg = "Anda yakin menghapus Tindakan yang dipilih?";
            $("#list").jqGrid({
                url: '<%= Url.Action("List", "Action") %>',
                datatype: 'json',
                mtype: 'GET',
                colNames: ['Kode Tindakan', 'Nama', 'Kategori Tindakan', 'Kategori Tindakan', 'Harga Jual', 'Alat & Bahan', 'Jasa Medis', 'Jasa Dokter', 'Jasa Terapis', 'Keterangan'],
                colModel: [
                    { name: 'Id', index: 'Id', width: 100, align: 'left', key: true, editrules: { required: true, edithidden: false }, hidedlg: true, hidden: false, editable: true },
                    { name: 'ActionName', index: 'ActionName', width: 200, align: 'left', editable: true, edittype: 'text', editrules: { required: true }, formoptions: { elmsuffix: ' *'} },
                    { name: 'ActionCatId', index: 'ActionCatId', width: 200, align: 'left', editable: true, edittype: 'select', editrules: { edithidden: true }, hidden: true },
                    { name: 'ActionCatName', index: 'ActionCatName', width: 200, align: 'left', editable: false, edittype: 'select', editrules: { edithidden: true} },
                     { name: 'ActionPrice', index: 'ActionPrice', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                         editoptions: {
                             dataInit: function (elem) {
                                 $(elem).autoNumeric();
                                 $(elem).attr("style", "text-align:right;");
                             }
                         }
                     },
                     { name: 'ActionComponentTool', index: 'ActionComponentTool', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                         editoptions: {
                             dataInit: function (elem) {
                                 $(elem).autoNumeric();
                                 $(elem).attr("style", "text-align:right;");
                             }
                         }
                     },
                     { name: 'ActionComponentMedician', index: 'ActionComponentMedician', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                         editoptions: {
                             dataInit: function (elem) {
                                 $(elem).autoNumeric();
                                 $(elem).attr("style", "text-align:right;");
                             }
                         }
                     },
                     { name: 'ActionComponentDoctor', index: 'ActionComponentDoctor', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                         editoptions: {
                             dataInit: function (elem) {
                                 $(elem).autoNumeric();
                                 $(elem).attr("style", "text-align:right;");
                             }
                         }
                     },
                     { name: 'ActionComponentTherapist', index: 'ActionComponentTherapist', width: 200, sortable: false, align: 'right', editable: true, editrules: { required: false },
                         editoptions: {
                             dataInit: function (elem) {
                                 $(elem).autoNumeric();
                                 $(elem).attr("style", "text-align:right;");
                             }
                         }
                     },
                   { name: 'ActionDesc', index: 'ActionDesc', width: 200, sortable: false, align: 'left', editable: true, edittype: 'textarea', editoptions: { rows: "3", cols: "20" }, editrules: { required: false}}],

                pager: $('#listPager'),
                rowNum: 20,
                rowList: [20, 30, 50, 100],
                rownumbers: true,
                sortname: 'Id',
                sortorder: "asc",
                viewrecords: true,
                height: 300,
                caption: 'Daftar Tindakan',
                autowidth: true,
                loadComplete: function () {
                    $('#list').setColProp('ActionCatId', { editoptions: { value: ActionCats} });
                },
                ondblClickRow: function (rowid, iRow, iCol, e) {
                    $("#list").editGridRow(rowid, editDialog);
                }
            }).navGrid('#listPager',
                {
                    edit: true, add: true, del: true, search: false, refresh: true
                },
                editDialog,
                insertDialog,
                deleteDialog
            );
        });
        var ActionCats = $.ajax({ url: '<%= Url.Action("GetList","ActionCat") %>', async: false, cache: false, success: function (data, result) { if (!result) alert('Failure to retrieve the ActionCats.'); } }).responseText;
    </script>
</asp:Content>
