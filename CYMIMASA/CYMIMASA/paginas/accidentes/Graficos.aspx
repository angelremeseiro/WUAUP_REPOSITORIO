<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/accidentes/accidentes.master" AutoEventWireup="true" CodeBehind="Graficos.aspx.cs" Inherits="CYMIMASA.paginas.accidentes.Graficos" %>

<%@ Register Assembly="Telerik.OpenAccess.Web.40" Namespace="Telerik.OpenAccess.Web" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <link href="/../../css/cuerpo.css" rel="stylesheet" type="text/css" />
    <link href="/../../css/GraficosBarras.css" rel="stylesheet" type="text/css" />

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>

    <telerik:RadAjaxPanel ID="Actualizar" runat="server">
        <div id="barraTitulo">&nbsp;&nbsp;Gráficos</div>
        <div id="cuerpo">
            <p class="seccion">Introduzca los Criterios para la Representación</p>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="BO" runat="server" Text="B.O." AssociatedControlID="ComboBO" Style="display: inline-block;" Width="25px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBO" runat="server" Height="300px" Width="144px"
                            DataSourceID="SqlDataSourceComboBO" DataTextField="BO"
                            OnItemDataBound="ComboBO_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBO" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Division" runat="server" Text="División" AssociatedControlID="ComboDivision" Style="display: inline-block;" Width="50px"></asp:Label>
                        <telerik:RadComboBox ID="ComboDivision" runat="server" Height="211px" Width="160px" AutoPostBack="true"
                            DataSourceID="SqlDataSourceComboDivision" DataTextField="NDivision" DataValueField="IDDivision"
                            OnItemDataBound="ComboDivision_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true" OnTextChanged="ComboBoxDivision_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboDivision" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Delegacion" runat="server" Text="Delegación" AssociatedControlID="ComboDelegacion" Style="display: inline-block;" Width="66px"></asp:Label>
                        <telerik:RadComboBox ID="ComboDelegacion" runat="server" Height="300px" Width="300px"
                            DataSourceID="SqlDataSourceComboDelegacion" DataTextField="NDelegacion" DataValueField="CC"
                            OnItemDataBound="ComboDelegacion_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true">
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
                        <telerik:RadComboBox ID="ComboClasificacion" runat="server" Height="120px" Width="100px"
                            DataSourceID="SqlDataSourceComboClasificacion" DataTextField="ClasificacionAccidente"
                            OnItemDataBound="ComboClasificacion_ItemDataBound" AllowCustomText="true" MarkFirstMatch="true" DataValueField="IDClasifAccid">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboClasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Anno" runat="server" Text="Año" AssociatedControlID="TextBoxAnno" Style="display: inline-block;" Width="36px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxAnno" runat="server" AutoPostBack="false" Enabled="true" Width="38px" MaxLength="4" InputType="Number">
                        </telerik:RadTextBox>
                    </td>

                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td style="width: 550px"></td>
                    <td>
                        <telerik:RadButton ID="BotonLimpiar" runat="server" Text="Limpiar" AutoPostBack="true" OnClick="BotonLimpiar_Click">
                            <Icon PrimaryIconCssClass="rbRemove" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="BotonGraficos" runat="server" Text="Gráficos" OnClick="BotonGraficos_Click">
                        <Icon SecondaryIconCssClass="rbRefresh" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                    </telerik:RadButton>
                    </td>

                </tr>
            </table>
            <p class="seccion">
                Gráficos según el Criterio Seleccionado.&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="TotalEncontrados" runat="server" Text="Accidentes en Total Encontrados: " AssociatedControlID="NumeroTotalEncontrados" Style="display: inline-block;" Width="180px" Visible="false"></asp:Label>
                <asp:Label ID="NumeroTotalEncontrados" runat="server" Text="0" AssociatedControlID="TextBoxAnno" Style="display: inline-block;" Width="50px" Visible="false"></asp:Label>
            </p>
            <table class="tabla">
                <tr>
                    <td>
                        <telerik:RadGrid ID="TablaConsultaAccidentes" DataSourceID="SqlDataSourceTablaConsultaAccidentes" runat="server" AllowPaging="True"
                            PageSize="1000" Width="833px" AllowMultiRowSelection="false" GridLines="None" Skin="Vista" OnItemDataBound="TablaConsultaAccidentes_ItemDataBound" AllowSorting="false">
                            <PagerStyle Mode="NextPrevAndNumeric" PageButtonCount="100" PageSizeLabelText="Tamaño Página" NextPagesToolTip="Páginas Siguientes" NextPageToolTip="Siguiente Página" PrevPagesToolTip="Páginas Previas" PrevPageToolTip="Página Previa" FirstPageToolTip="Primera Página" GoToPageButtonToolTip="Ir a la Página" ChangePageSizeButtonToolTip="Cambiar Tamaño Página" LastPageToolTip="Última Página"></PagerStyle>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="SqlDataSourceTablaConsultaAccidentes" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>" runat="server"></asp:SqlDataSource>

                    </td>
                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td>

                        <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
                        <div class="mainWrapper">
                            <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Width="810px" Height="550px" Visible="false">
                                <PlotArea>
                                    <Series>
                                        <telerik:ColumnSeries Name="Accidentes" DataFieldY="Valor" ColorField="Color">
                                            <Appearance>
                                                <FillStyle BackgroundColor="#30abf2" />
                                            </Appearance>
                                        </telerik:ColumnSeries>
                                    </Series>
                                    <XAxis DataLabelsField="Mes" Color="#aaaaaa">
                                        <MajorGridLines Color="#cccccc" />
                                        <MinorGridLines Color="#eeeeee" />
                                        <LabelsAppearance DataFormatString="{0}">
                                            <TextStyle Color="#666666" />
                                        </LabelsAppearance>
                                    </XAxis>
                                    <YAxis Color="#aaaaaa">
                                        <LabelsAppearance>
                                            <TextStyle Color="#666666" />
                                        </LabelsAppearance>
                                        <MajorGridLines Color="#cccccc" />
                                        <MinorGridLines Color="#eeeeee" />

                                    </YAxis>
                                </PlotArea>
                                <Legend>
                                    <Appearance Visible="false" />
                                </Legend>
                            </telerik:RadHtmlChart>

                        </div>

                    </td>
                </tr>
            </table>









        </div>
    </telerik:RadAjaxPanel>
</asp:Content>



