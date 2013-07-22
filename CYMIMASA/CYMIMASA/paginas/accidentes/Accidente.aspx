<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/accidentes/accidentes.master" AutoEventWireup="true" CodeBehind="Accidente.aspx.cs" Inherits="CYMIMASA.paginas.accidentes.Accidente" %>

<%@ Register Assembly="Telerik.OpenAccess.Web.40" Namespace="Telerik.OpenAccess.Web" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <link href="/../../css/cuerpo.css" rel="stylesheet" type="text/css" />

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>

    <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>

    <telerik:RadAjaxPanel ID="Actualizar" runat="server">

        <div id="barraTitulo" runat="server" style="color: white; text-shadow: black 0.1em 0.1em 0.1em; border-width: 0px; border-style: solid; border-color: #000000; font-size: 16pt; height: 16px; width: 800px; background-color: white; padding: 16px; padding-left: 16px; font-family: Calibri,verdana, helvetica; background-image: url(/paginas/images/BarraTitulo.png);">
            &nbsp;&nbsp;
        <asp:Label ID="NuevoAccidente" runat="server" Text="Nuevo Accidente" Width="300px"></asp:Label>
            <asp:Label ID="EspacioTitulo" runat="server" Text="" Width="384px"></asp:Label>
            <asp:Label ID="Codigo" runat="server" Text="Código" AssociatedControlID="TextBoxCodigo" Style="display: inline-block; font-size: 12px; text-shadow: none; font-stretch: ultra-condensed; color: black" Width="40px"></asp:Label>
            <telerik:RadTextBox ID="TextBoxCodigo" runat="server" Text="" Width="70px" Enabled="false" Font-Bold="true">
            </telerik:RadTextBox>
        </div>

        <div id="cuerpo">

            <p class="seccion">
                <asp:Label ID="DatosGenerales" runat="server" Text="Datos Generales del Informe"></asp:Label>
            </p>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="BO" runat="server" Text="B.O." AssociatedControlID="ComboBO" Style="display: inline-block;" Width="24px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBO" runat="server" Height="200px" Width="160px" AutoPostBack="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBO" DataTextField="BO"
                            OnItemDataBound="ComboBO_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" MaxLength="50" OnTextChanged="ComboBO_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBO" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand="SELECT [BO] FROM [MBO] ORDER BY [BO]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="NBO" runat="server" Text="N.B.O." AssociatedControlID="TextBoxNBO" Style="display: inline-block;" Width="36px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxNBO" runat="server" AutoPostBack="false" Enabled="false" Width="357px">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="FechaRegistro" runat="server" Text="Fecha Registro" AssociatedControlID="TextBoxFechaRegistro" Style="display: inline-block;" Width="95px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxFechaRegistro" runat="server" AutoPostBack="true" Enabled="false" Width="84">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="CentroOperativo" runat="server" Text="Centro Operativo" AssociatedControlID="TextBoxCentroOperativo" Style="display: inline-block;" Width="100px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxCentroOperativo" runat="server" AutoPostBack="false" Text="" Width="270px" Enabled="false">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Empresa" runat="server" Text="Empresa" AssociatedControlID="TextBoxEmpresa" Style="display: inline-block;" Width="50px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxEmpresa" runat="server" AutoPostBack="true" Text="" Width="342px" Enabled="false">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="Delegacion" runat="server" Text="Delegación" AssociatedControlID="TextBoxDelegacion" Style="display: inline-block;" Width="65px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxDelegacion" runat="server" AutoPostBack="true" Enabled="false" Width="250">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="Division" runat="server" Text="División" AssociatedControlID="TextBoxDivision" Style="display: inline-block;" Width="50px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxDivision" runat="server" AutoPostBack="true" Enabled="false" Width="191">
                        </telerik:RadTextBox>
                    </td>



                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="Subcontratista" runat="server" Text="Subcontratista" AssociatedControlID="RadButtonSubcontratistaSi" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadButton ID="RadButtonSubcontratistaSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton" OnClick="RadButtonSubcontratistaSi__Click"
                            GroupName="RadiosSubcontratista" AutoPostBack="true">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>


                        <telerik:RadButton ID="RadButtonSubcontratistaNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosSubcontratista" AutoPostBack="true" OnClick="RadButtonSubcontratistaNo__Click">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="NombreSubcontrata" runat="server" Text="Nombre Subcontrata" AssociatedControlID="TextBoxNombreSubcontrata" Style="display: inline-block;" Width="122px" Visible="false"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxNombreSubcontrata" runat="server" AutoPostBack="true" Text="" Width="270px" Enabled="true" InputType="Text" MaxLength="140" Visible="false" OnTextChanged="NombreSubcontrata_TextChanged">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>



            <p class="seccion">
                <asp:Label ID="DatosAccidentado" runat="server" Text="Datos del Trabajador Accidentado"></asp:Label>
            </p>
            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="NIFTrabajador" runat="server" Text="N.I.F." AssociatedControlID="ComboBoxNIFTrabajador" Style="display: inline-block;" Width="26px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxNIFTrabajador" runat="server" Width="100px" Height="200px" AutoPostBack="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxNIFTrabajador" DataTextField="NIFTrabajador"
                            OnItemDataBound="ComboBoxNIFTrabajador_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" OnTextChanged="NIFTrabajador_TextChanged" Visible="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxNIFTrabajador" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand="SELECT [NIFTrabajador] FROM [MPersonal] ORDER BY [NIFTrabajador]"></asp:SqlDataSource>

                        <telerik:RadTextBox ID="TextBoxNIFTrabajador" runat="server" AutoPostBack="true" Text="" Width="100px" Enabled="true" MaxLength="10" Visible="false" OnTextChanged="TextNIFTrabajador_TextChanged">
                        </telerik:RadTextBox>


                    </td>

                    <td>&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Apellidos" runat="server" Text="Apellidos" AssociatedControlID="TextBoxApellidos" Style="display: inline-block;" Width="54px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxApellidos" runat="server" AutoPostBack="true" Text="" Width="150px" Enabled="false" MaxLength="50" OnTextChanged="Apellidos_TextChanged">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;
                    <asp:Label ID="Nombre" runat="server" Text="Nombre" AssociatedControlID="TextBoxNombre" Style="display: inline-block;" Width="50px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxNombre" runat="server" AutoPostBack="true" Text="" Width="120px" Enabled="false" MaxLength="25" OnTextChanged="Nombre_TextChanged">
                        </telerik:RadTextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Categoria" runat="server" Text="Categoría Profesional" AssociatedControlID="TextBoxCategoria" Style="display: inline-block;" Width="120px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxCategoria" runat="server" AutoPostBack="true" Text="" Width="122px" Enabled="true" MaxLength="50" OnTextChanged="Categoria_TextChanged">
                        </telerik:RadTextBox>
                    </td>

                </tr>
            </table>
            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="PuestoTrabajo" runat="server" Text="Puesto de Trabajo" AssociatedControlID="TextBoxPuestoTrabajo" Style="display: inline-block;" Width="110px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxPuestoTrabajo" runat="server" AutoPostBack="false" Text="" Width="240px" Enabled="true" MaxLength="140">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;
                        <asp:Label ID="TrabajoRealizaba" runat="server" Text="Trabajo que Realizaba" AssociatedControlID="TextBoxTrabajoRealizaba" Style="display: inline-block;" Width="120px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxTrabajoRealizaba" runat="server" AutoPostBack="false" Text="" Width="308px" Enabled="true" MaxLength="140">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="ExperienciaPuesto" runat="server" Text="Experiencia en el Puesto" AssociatedControlID="TexBoxExperienciaPuesto" Style="display: inline-block;" Width="132px"></asp:Label>
                        <telerik:RadTextBox ID="TexBoxExperienciaPuesto" runat="server" AutoPostBack="false" Text="" Width="217px" Enabled="true" MaxLength="140">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;
                        <asp:Label ID="Antiguedad" runat="server" Text="Antiguedad" AssociatedControlID="TextBoxAntiguedad" Style="display: inline-block;" Width="70px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxAntiguedad" runat="server" AutoPostBack="true" Text="" Width="25px" Enabled="true" OnTextChanged="TextBoxAntiguedad_TextChanged" MaxLength="2" InputType="Number">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="MandoSuperior" runat="server" Text="Mando Superior" AssociatedControlID="TextBoxMandoSuperior" Style="display: inline-block;" Width="100px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxMandoSuperior" runat="server" AutoPostBack="false" Text="" Width="202px" Enabled="true" MaxLength="140">
                        </telerik:RadTextBox>

                    </td>
                </tr>
            </table>



            <p class="seccion">
                <asp:Label ID="DatosAccidente" runat="server" Text="Datos del Accidente"></asp:Label>
            </p>
            <table class="tabla">
                <tr>


                    <td>
                        <asp:Label ID="FechaAccidente" runat="server" Text="Fecha Accidente" AssociatedControlID="DatePickerFechaAccidente" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadDatePicker ID="DatePickerFechaAccidente" runat="server" MinDate="1920-01-01" SharedCalendarID="sharedCalendar"
                            Width="100px" AutoPostBack="true">
                            <DateInput runat="server" ID="InputFechaAccidente" OnTextChanged="InputFechaAccidente_TextChanged" AutoPostBack="true">
                            </DateInput>
                        </telerik:RadDatePicker>

                        <telerik:RadCalendar ID="sharedCalendar" runat="server" EnableMultiSelect="false"
                            RangeMinDate="1920/01/01">
                        </telerik:RadCalendar>
                    </td>


                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Hora" runat="server" Text="Hora" AssociatedControlID="ComboBoxHora" Style="display: inline-block;" Width="32px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxHora" runat="server" Width="90px" Height="200px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxHora" DataTextField="Hora" DataValueField="IDHora"
                            OnItemDataBound="ComboBoxHora_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" OnTextChanged="ComboBoxHora_TextChanged" AutoPostBack="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxHora" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="DiaSemana" runat="server" Text="Día de la Semana" AssociatedControlID="ComboBoxDiaSemana" Style="display: inline-block;" Width="100px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxDiaSemana" runat="server" Width="100px" Height="150px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxComboBoxDiaSemana" DataTextField="Dia" DataValueField="IDDia"
                            OnItemDataBound="ComboBoxHora_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" OnTextChanged="ComboBoxDiaSemana_TextChanged" AutoPostBack="true">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxComboBoxDiaSemana" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="TrabajoHabitual" runat="server" Text="Trabajo Habitual" AssociatedControlID="RadButtonTrabajoHabitualSi" Style="display: inline-block;" Width="100px"></asp:Label>
                        <telerik:RadButton ID="RadButtonTrabajoHabitualSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosTrabajoHabitual" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>


                        <telerik:RadButton ID="RadButtonTrabajoHabitualNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosTrabajoHabitual" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>

                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="Clasificacion" runat="server" Text="Clasificación" AssociatedControlID="ComboBoxClasificacion" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxClasificacion" runat="server" Width="130px" Height="100px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxClasificacion" DataTextField="ClasificacionAccidente" DataValueField="IDClasifAccid"
                            OnItemDataBound="ComboBoxClasificacion_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxClasificacion_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxClasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>


                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="FechaBaja" runat="server" Text="Fecha de Baja" AssociatedControlID="DatePickerFechaBaja" Style="display: inline-block;" Width="80px"></asp:Label>
                        <telerik:RadDatePicker ID="DatePickerFechaBaja" runat="server" MinDate="1920-01-01" SharedCalendarID="sharedCalendar" Width="100px">
                            <DateInput runat="server" ID="InputFechaBaja" OnTextChanged="InputFechaBaja_TextChanged" AutoPostBack="true">
                            </DateInput>
                        </telerik:RadDatePicker>

                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FechaAlta" runat="server" Text="Fecha de Alta" AssociatedControlID="DatePickerFechaAlta" Style="display: inline-block;" Width="80px"></asp:Label>
                        <telerik:RadDatePicker ID="DatePickerFechaAlta" runat="server" MinDate="1920-01-01" SharedCalendarID="sharedCalendar" Width="100px">
                            <DateInput runat="server" ID="InputFechaAlta" OnTextChanged="InputFechaAlta_TextChanged" AutoPostBack="true">
                            </DateInput>
                        </telerik:RadDatePicker>

                    </td>


                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="JornadasPerdidas" runat="server" Text="Jornadas Perdidas" AssociatedControlID="TextBoxJornadasPerdidas" Style="display: inline-block;" Width="100px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxJornadasPerdidas" runat="server" AutoPostBack="true" Text="" Width="40px" Enabled="true" OnTextChanged="TextBoxJornadasPerdidas_TextChanged" InputType="Number" MaxLength="4">
                        </telerik:RadTextBox>
                    </td>



                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="LugarTrabajo" runat="server" Text="Lugar de Trabajo" AssociatedControlID="ComboBoxLugarTrabajo" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxLugarTrabajo" runat="server" Width="250px" Height="300px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxLugarTrabajo" DataTextField="LugarTrabajo" DataValueField="IDLugarTrabajo"
                            OnItemDataBound="ComboBoxLugarTrabajo_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxLugarTrabajo_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxLugarTrabajo" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                    <td>

                        <telerik:RadTextBox ID="TextBoxOtroLugarTrabajo" runat="server" AutoPostBack="true" Text="" Width="450px" Enabled="true" InputType="Text" MaxLength="255" Visible="false">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            <table class="tabla">
                <tr>

                    <td>
                        <asp:Label ID="Consecuencias" runat="server" Text="Consecuencias" AssociatedControlID="ComboBoxConsecuencias" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxConsecuencias" runat="server" Width="134px" Height="100px"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxConsecuencias" DataTextField="Consecuencias" DataValueField="IDConsecuencias"
                            OnItemDataBound="ComboBoxConsecuencias_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxConsecuencias_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxConsecuencias" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Edad" runat="server" Text="Edad" AssociatedControlID="TextBoxEdad" Style="display: inline-block;" Width="40px"></asp:Label>
                        <telerik:RadTextBox ID="TextBoxEdad" runat="server" AutoPostBack="true" Text="" Width="25px" Enabled="true" OnTextChanged="TextBoxEdad_TextChanged" MaxLength="2" InputType="Number">
                        </telerik:RadTextBox>
                    </td>



                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="Descripcion" runat="server" Text="Descripción" AssociatedControlID="TextBoxDescripcion" Style="display: inline-block;" Width="96px"></asp:Label>

                        <telerik:RadTextBox ID="TextBoxDescripcion" runat="server" AutoPostBack="true" Text="" Width="704px" Height="60" Enabled="true" TextMode="MultiLine" OnTextChanged="TextBoxDescripcion_TextChanged" MaxLength="4000">
                        </telerik:RadTextBox>
                    </td>

                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="ParteLesionada" runat="server" Text="Parte Lesionada" AssociatedControlID="ComboBoxParteLesionada" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxParteLesionada" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxParteLesionada" DataTextField="ParteLesionada" DataValueField="IDParteLesionada"
                            OnItemDataBound="ComboBoxParteLesionada_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoCompleteSeparator=";" EnableTextSelection="False" AutoPostBack="true" OnTextChanged="ComboBoxParteLesionada_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxParteLesionada" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="TipoLesion" runat="server" Text="Tipo Lesión" AssociatedControlID="ComboBoxTipoLesion" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxTipoLesion" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxTipoLesion" DataTextField="TipoLesion" DataValueField="IDTipoLesion"
                            OnItemDataBound="ComboBoxTipoLesion_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxTipoLesion_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxTipoLesion" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="ActosInseguros" runat="server" Text="Actos Inseguros" AssociatedControlID="ComboBoxActosInseguros" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxActosInseguros" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxActosInseguros" DataTextField="ActosInseguros" DataValueField="IDActosInseguros"
                            OnItemDataBound="ComboBoxActosInseguros_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxActosInseguros_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxActosInseguros" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="CondicionesInseguras" runat="server" Text="Cond. Inseguras" AssociatedControlID="ComboBoxCondicionesInseguras" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxCondicionesInseguras" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxCondicionesInseguras" DataTextField="CondicionesInseguras" DataValueField="IDCondInseguras"
                            OnItemDataBound="ComboBoxCondicionesInseguras_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxCondicionesInseguras_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxCondicionesInseguras" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="FormaSuceso" runat="server" Text="Forma Suceso" AssociatedControlID="ComboBoxFormaSuceso" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxFormaSuceso" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxFormaSuceso" DataTextField="FormaSuceso" DataValueField="IDFormaSuceso"
                            OnItemDataBound="ComboBoxFormaSuceso_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxFormaSuceso_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxFormaSuceso" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>
                        <asp:Label ID="TipoRiesgo" runat="server" Text="Tipo Riesgo" AssociatedControlID="ComboBoxTipoRiesgo" Style="display: inline-block;" Width="96px"></asp:Label>
                        <telerik:RadComboBox ID="ComboBoxTipoRiesgo" runat="server" Width="704px" Height="200px" CheckBoxes="true"
                            EmptyMessage=" " DataSourceID="SqlDataSourceComboBoxTipoRiesgo" DataTextField="TipoRiesgo" DataValueField="IDTipodeRiesgo"
                            OnItemDataBound="ComboBoxTipoRiesgo_ItemDataBound" AllowCustomText="false" MarkFirstMatch="true" AutoPostBack="true" OnTextChanged="ComboBoxTipoRiesgo_TextChanged">
                        </telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSourceComboBoxTipoRiesgo" runat="server" ConnectionString="<%$ ConnectionStrings:BBDDConexion %>"
                            SelectCommand=""></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <p class="seccion">
                <asp:Label ID="Cuestiones" runat="server" Text="Cuestiones"></asp:Label>
            </p>
            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="IdentificadoRiesgoEvaluacion" runat="server" Text="¿Identificado el Riesgo en la Evaluación?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonIdentificadoRiesgoEvaluacionSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosIdentificadoRiesgoEvaluacion" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonIdentificadoRiesgoEvaluacionNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosIdentificadoRiesgoEvaluacion" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="EvaluarRiesgos" runat="server" Text="¿Revisar la Evalución de Riesgos?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonEvaluarRiesgosSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosEvaluarRiesgos" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonEvaluarRiesgosNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosEvaluarRiesgos" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="FormadoInformadoRiesgo" runat="server" Text="¿Se encuentra correctamente formado e informado del Riesgo?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonFormadoInformadoRiesgoSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosFormadoInformadoRiesgo" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonFormadoInformadoRiesgoNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosFormadoInformadoRiesgo" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="EquiposProteccionDefinidosActividad" runat="server" Text="¿LLeva todo los equipos de protección definidos para la actividad?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonEquiposProteccionDefinidosActividadSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosEquiposProteccionDefinidosActividad" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonEquiposProteccionDefinidosActividadNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosEquiposProteccionDefinidosActividad" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Seevacuoelaccidentadorapidaycorrectamente" runat="server" Text="Se evacuó el accidentado rápida y correctamente?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonSeevacuoelaccidentadorapidaycorrectamenteSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosSeevacuoelaccidentadorapidaycorrectamente" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonSeevacuoelaccidentadorapidaycorrectamenteNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosSeevacuoelaccidentadorapidaycorrectamente" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="AtendidoAmbulanciaServiciosdeUrgencia" runat="server" Text="¿Tuvo que ser atendido por Ambulancia o Servicios de Urgencia?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonAtendidoAmbulanciaServiciosdeUrgenciaSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosAtendidoAmbulanciaServiciosdeUrgencia" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonAtendidoAmbulanciaServiciosdeUrgenciaNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosAtendidoAmbulanciaServiciosdeUrgencia" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="ConsecuenciaRiesgoElectricoAltura" runat="server" Text="¿Se produce por consecuencia del Riesgo Eléctrico y/o Altura?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonConsecuenciaRiesgoElectricoAlturaSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosConsecuenciaRiesgoElectricoAltura" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonConsecuenciaRiesgoElectricoAlturaNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosConsecuenciaRiesgoElectricoAltura" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="ExisteProcedimientoTrabajoActividad" runat="server" Text="Existe procedimiento de trabajo que describa la Actividad?" AssociatedControlID="RadButtonEvaluarRiesgosSi" Style="display: inline-block;" Width="380px"></asp:Label>
                        <telerik:RadButton ID="RadButtonExisteProcedimientoTrabajoActividadSi" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosExisteProcedimientoTrabajoActividad" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="Si"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>

                        <telerik:RadButton ID="RadButtonExisteProcedimientoTrabajoActividadNo" runat="server" ToggleType="Radio" ButtonType="ToggleButton"
                            GroupName="RadiosExisteProcedimientoTrabajoActividad" AutoPostBack="false">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="No  "></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="No"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>

            <p class="seccion">
                <asp:Label ID="EquipoInvestigacion" runat="server" Text="Equipo de Investigación"></asp:Label>
            </p>
            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="EquipoInvestigacionApellidos" runat="server" Text="Apellidos" AssociatedControlID="TextBoxEquipoInvestigacion1Apellidos" Style="display: inline-block;" Width="96px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="EquipoInvestigacionNombre" runat="server" Text="Nombre" AssociatedControlID="TextBoxEquipoInvestigacion1Nombre" Style="display: inline-block;" Width="50px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="EquipoInvestigacionPuestoTrabajo" runat="server" Text="Puesto de Trabajo" AssociatedControlID="TextBoxEquipoInvestigacion1PuestoTrabajo" Style="display: inline-block;" Width="100px"></asp:Label>
                    </td>
                </tr>
            </table>

            <table class="tabla">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion1Apellidos" runat="server" AutoPostBack="false" Text="" Width="180px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;
                  
                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion1Nombre" runat="server" AutoPostBack="false" Text="" Width="130px" Enabled="true" MaxLength="25">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;

                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion1PuestoTrabajo" runat="server" AutoPostBack="false" Text="" Width="210px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>
                </tr>

            </table>

            <table class="tabla">
                <tr>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion2Apellidos" runat="server" AutoPostBack="false" Text="" Width="180px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;

                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion2Nombre" runat="server" AutoPostBack="false" Text="" Width="130px" Enabled="true" MaxLength="25">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;

                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion2PuestoTrabajo" runat="server" AutoPostBack="false" Text="" Width="210px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>
                </tr>

            </table>

            <table class="tabla">
                <tr>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion3Apellidos" runat="server" AutoPostBack="false" Text="" Width="180px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;
                    
                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion3Nombre" runat="server" AutoPostBack="false" Text="" Width="130px" Enabled="true" MaxLength="25">
                        </telerik:RadTextBox>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;

                        <telerik:RadTextBox ID="TextBoxEquipoInvestigacion3PuestoTrabajo" runat="server" AutoPostBack="false" Text="" Width="210px" Enabled="true" MaxLength="50">
                        </telerik:RadTextBox>
                    </td>
                </tr>

            </table>




            <p class="seccion">
                <asp:Label ID="AccionesCorrectoras" runat="server" Text="Acciones"></asp:Label>
            </p>
            <table class="tabla">
                <tr>
                    <td>
                        <telerik:RadGrid ID="TablaConsultaAccidentes" DataSourceID="SqlDataSourceTablaConsultaAccidentes" runat="server" AllowPaging="True"  AutoPostBack="true"
                            PageSize="5" Width="833px" AllowMultiRowSelection="false" GridLines="None" Skin="Vista"  AllowSorting="true" >
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

            <p class="seccion">
                <asp:Label ID="ArchivosAdjuntos" runat="server" Text="Archivos Adjuntos"></asp:Label>
            </p>
            <table class="tabla">

                <tr>
                    <td>
                        <telerik:RadProgressManager runat="server" ID="RadProgressManager1" />
                        <div class="tabla">
                            <telerik:RadAsyncUpload runat="server" ID="AsyncUpload1" MultipleFileSelection="Automatic" TargetFolder="C:\CYMIMASA\Donwload" />
                            <telerik:RadProgressArea runat="server" ID="RadProgressArea1" />
                        </div>
                    </td>

                </tr>
            </table>


            <table class="tabla">
                <tr>
                    <td style="width: 460px"></td>

                    <td>
                        <telerik:RadButton ID="Idioma" runat="server" Text="Idioma" OnClick="Idioma_Click" AutoPostBack="true">
                            <Icon PrimaryIconCssClass="rbRSS" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                        </telerik:RadButton>
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <telerik:RadButton ID="Imprimir" runat="server" Text="Imprimir" OnClick="Imprimir_Click" AutoPostBack="true">
                            <Icon PrimaryIconCssClass="rbPrint" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <telerik:RadButton ID="Cancelar" runat="server" Text="Cancelar" OnClick="Cancelar_Click" AutoPostBack="true">
                            <Icon PrimaryIconCssClass="rbCancel" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                        </telerik:RadButton>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="Guardar" runat="server" Text="Guardar " OnClick="Guardar_Click" AutoPostBack="true">
                        <Icon SecondaryIconCssClass="rbSave" PrimaryIconLeft="4" PrimaryIconTop="4"></Icon>
                    </telerik:RadButton>
                    </td>

                </tr>
            </table>
        </div>

    </telerik:RadAjaxPanel>
</asp:Content>
