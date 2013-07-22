<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/accidentes/accidentes.master" AutoEventWireup="true" CodeBehind="ConsultaAccidentes.aspx.cs" Inherits="CYMIMASA.paginas.accidentes.ConsultaAccidentes" %>

<%@ Register Assembly="Telerik.OpenAccess.Web.40" Namespace="Telerik.OpenAccess.Web" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <link href="/../../css/cuerpo.css" rel="stylesheet" type="text/css" />

    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <script type="text/javascript">
        function onRequestStart(sender, args) {
            if (args.get_eventTarget().indexOf("ExportTo") >= 0) {
                args.set_enableAjax(false);
            }
        }
    </script>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <ClientEvents OnRequestStart="onRequestStart"></ClientEvents>
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TablaConsultaAccidentes">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TablaConsultaAccidentes"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadWindowManager ID="RadWindowManager" runat="server" EnableShadow="true">
        <Windows>
            <telerik:RadWindow ID="RadWindow1" runat="server" ShowContentDuringLoad="false" Width="900px"
                Height="700px" Title="Editar Accidente" Behaviors="Default" Animation="Fade" BorderStyle="None" VisibleTitlebar="true">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>

    <telerik:RadAjaxPanel ID="Actualizar" runat="server">


        <div id="barraTitulo">&nbsp;&nbsp;Consulta Accidentes</div>
        <div id="cuerpo">
            <p class="seccion">Introduzca Criterios de Filtrado</p>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="NIFTrabajador" runat="server" Text="Trabajador" AssociatedControlID="ComboBoxNIFTrabajador" Style="display: inline-block;" Width="70px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxNIFTrabajador" runat="server" Width="100px" Height="300px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxNIFTrabajador" DataTextField="NIFTrabajador"
                            OnItemDataBound="ComboBoxNIFTrabajador_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxNIFTrabajador" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>


                    <td>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Division" runat="server" Text="División" AssociatedControlID="ComboDivision" Style="display: inline-block;" Width="50px"></asp:Label>
                        <telerik:RadComboBox ID="ComboDivision" runat="server" Height="300px" Width="160px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboDivision" DataTextField="NDivision" OnItemDataBound="ComboDivision_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true" OnTextChanged="ComboBoxDivision_TextChanged" DataValueField="IDDivision" AutoPostBack="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboDivision" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Delegacion" runat="server" Text="Delegación" AssociatedControlID="ComboDelegacion" Style="display: inline-block;" Width="66px"></asp:Label>
                        <telerik:RadComboBox ID="ComboDelegacion" runat="server" Height="300px" Width="300px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboDelegacion" DataTextField="NDelegacion"
                            OnItemDataBound="ComboDelegacion_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true" DataValueField="CC">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboDelegacion" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="Clasificacion" runat="server" Text="Clasificación" AssociatedControlID="ComboClasificacion" Style="display: inline-block;" Width="70px"></asp:Label>
                        <telerik:RadComboBox ID="ComboClasificacion" runat="server" Height="100px" Width="100px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboClasificacion" DataTextField="ClasificacionAccidente"
                            OnItemDataBound="ComboClasificacion_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true" DataValueField="IDClasifAccid">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboClasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FechaAccidenteDesde" runat="server" Text="Fecha desde" AssociatedControlID="DatePickerFechaAccidenteDesde" Style="display: inline-block;" Width="70px"></asp:Label>
                        <telerik:RadDatePicker ID="DatePickerFechaAccidenteDesde" runat="server" MinDate="1920-01-01" SharedCalendarID="sharedCalendar"
                            Width="100px">
                            <DateInput runat="server" ID="InputFechaAccidenteDesde">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
                    <td>&nbsp;&nbsp;
                    <asp:Label ID="FechaAccidenteHasta" runat="server" Text="a" AssociatedControlID="DatePickerFechaAccidenteHasta" Style="display: inline-block;" Width="16px"></asp:Label>
                        <telerik:RadDatePicker ID="DatePickerFechaAccidenteHasta" runat="server" MinDate="1920-01-01" SharedCalendarID="sharedCalendar"
                            Width="100px">
                            <DateInput runat="server" ID="DateInput1">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
                </tr>
            </table>
            <telerik:RadCalendar ID="sharedCalendar" runat="server" EnableMultiSelect="false"
                RangeMinDate="1920/01/01">
            </telerik:RadCalendar>

            <table class="tabla">
                <tr>
                    <td style="width: 550px"></td>
                    <td>
                        <telerik:RadButton ID="BotonLimpiar" runat="server" Text="Limpiar" AutoPostBack="true" OnClick="BotonLimpiar_Click">
                            <Icon PrimaryIconCssClass="rbRemove" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="BotonBuscar" runat="server" Text="Buscar  " OnClick="BotonBuscar_Click" AutoPostBack="true">
                        <Icon SecondaryIconCssClass="rbSearch" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                    </telerik:RadButton>
                    </td>

                </tr>
            </table>

            <p class="seccion">Resultados de la Búsqueda</p>


            <table class="tabla">
                <tr>
                    <td>
                        <telerik:RadGrid ID="TablaConsultaAccidentes" DataSourceID="SqlDataSourceTablaConsultaAccidentes" runat="server" AllowPaging="True" OnSelectedIndexChanged="TablaConsultaAccidentes_SelectedIndexChanged" AutoPostBack="true"
                            PageSize="5" Width="833px" AllowMultiRowSelection="false" GridLines="None" Skin="Vista" OnItemDataBound="TablaConsultaAccidentes_ItemDataBound" AllowSorting="true" OnItemCommand="TablaConsultaAccidentes_ItemCommand">
                            <ExportSettings HideStructureColumns="true">
                            </ExportSettings>
                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                <Selecting AllowRowSelect="true"></Selecting>
                            </ClientSettings>
                            <SelectedItemStyle CssClass="SelectedItem"></SelectedItemStyle>
                            <MasterTableView Width="100%" CommandItemDisplay="Top">
                                <PagerStyle Mode="NextPrevAndNumeric" PageButtonCount="100" PageSizeLabelText="Tamaño Página" NextPagesToolTip="Páginas Siguientes" NextPageToolTip="Siguiente Página" PrevPagesToolTip="Páginas Previas" PrevPageToolTip="Página Previa" FirstPageToolTip="Primera Página" GoToPageButtonToolTip="Ir a la Página" ChangePageSizeButtonToolTip="Cambiar Tamaño Página" LastPageToolTip="Última Página"></PagerStyle>
                                <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true"
                                    ShowExportToCsvButton="true" ShowExportToPdfButton="false" AddNewRecordText="Añadir Nuevo Accidente" RefreshText="Actualizar" ShowAddNewRecordButton="false" ExportToCsvText="Exportar a CSV" ExportToExcelText="Exportar a Excel" ExportToWordText="Exportar a Word" ExportToPdfText="Exportar a PDF" ShowRefreshButton="false"></CommandItemSettings>
                                <Columns>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSourceTablaConsultaAccidentes" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>" runat="server"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>


    </telerik:RadAjaxPanel>

    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1">
    </telerik:RadAjaxLoadingPanel>



</asp:Content>
