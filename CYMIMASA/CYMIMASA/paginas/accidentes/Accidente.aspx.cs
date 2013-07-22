using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

using System.Drawing;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;


namespace CYMIMASA.paginas.accidentes
{
    public partial class Accidente : System.Web.UI.Page
    {
        public string Idioma;
        public System.Drawing.Color ColorAlerta = System.Drawing.Color.FromArgb(255, 200, 200);
        public System.Drawing.Color ColorSinAlerta = System.Drawing.Color.FromArgb(255, 255, 255);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Idioma = "ES";
                CambiaSelect();
                Session["Idioma"] = Idioma;

                string valor = Page.Request.QueryString["Codigo"];
                if (valor != null && valor != string.Empty)
                { // Se ejecuta sólo la primera vez que se accede a la página y se cargan datos.
                    NuevoAccidente.Text = "Modificar Accidente";
                    LeerAccidente(valor);
                    Imprimir.Visible = true;
                    EspacioTitulo.Width = 340;
                }
                else
                    
                {
                    // Aqui código MJM. Se ejecuta sólo la primera vez que se accede a la página y no se carga de ningún lado.
                    // RadButtonSubcontratistaNo, RadButtonTrabajoHabitualNo
                    RadButtonTrabajoHabitualNo.Checked = true;
                    RadButtonSubcontratistaNo.Checked = true;
                    RadButtonSubcontratistaNo.Checked = true;
                    RadButtonIdentificadoRiesgoEvaluacionNo.Checked = true;
                    RadButtonEvaluarRiesgosNo.Checked = true;
                    RadButtonFormadoInformadoRiesgoNo.Checked = true;
                    RadButtonEquiposProteccionDefinidosActividadNo.Checked = true;
                    RadButtonSeevacuoelaccidentadorapidaycorrectamenteNo.Checked = true;
                    RadButtonAtendidoAmbulanciaServiciosdeUrgenciaNo.Checked = true;
                    RadButtonConsecuenciaRiesgoElectricoAlturaNo.Checked = true;
                    RadButtonExisteProcedimientoTrabajoActividadNo.Checked = true;
                    Imprimir.Visible = false;
                    barraTitulo.Style["width"] = "962px";
                }

            }
            else
            {
                Idioma = (string)Session["Idioma"];
            }

        }

        protected void CambiaSelect()
        {
            SqlDataSourceComboBoxHora.SelectCommand = "SELECT [IDHora],[Hora] FROM [MAccidHora] WHERE Idioma='" + Idioma + "' ORDER BY [Hora]";
            SqlDataSourceComboBoxClasificacion.SelectCommand = "SELECT [IDClasifAccid],[ClasificacionAccidente] FROM [MAccidClasificacionAccidente] WHERE Idioma='" + Idioma + "' ORDER BY [ClasificacionAccidente]";
            SqlDataSourceComboBoxConsecuencias.SelectCommand = "SELECT [IDConsecuencias],[Consecuencias] FROM [MAccidConsecuencias] WHERE Idioma='" + Idioma + "' ORDER BY [Consecuencias]";
            SqlDataSourceComboBoxLugarTrabajo.SelectCommand = "SELECT [IDLugarTrabajo],[LugarTrabajo] FROM [MAccidLugarTrabajo] WHERE Idioma='" + Idioma + "' ORDER BY [LugarTrabajo]";
            SqlDataSourceComboBoxParteLesionada.SelectCommand = "SELECT [IDParteLesionada],[ParteLesionada] FROM [MAccidParteLesionada] WHERE Idioma='" + Idioma + "' ORDER BY [ParteLesionada]";
            SqlDataSourceComboBoxTipoLesion.SelectCommand = "SELECT [IDTipoLesion],[TipoLesion] FROM [MAccidTipoLesion] WHERE Idioma='" + Idioma + "' ORDER BY [TipoLesion]";
            SqlDataSourceComboBoxActosInseguros.SelectCommand = "SELECT [IDActosInseguros],[ActosInseguros] FROM [MAccidActosInseguros] WHERE Idioma='" + Idioma + "' ORDER BY [ActosInseguros]";
            SqlDataSourceComboBoxCondicionesInseguras.SelectCommand = "SELECT [IDCondInseguras],[CondicionesInseguras] FROM [MAccidCondicionesInseguras] WHERE Idioma='" + Idioma + "' ORDER BY [CondicionesInseguras]";
            SqlDataSourceComboBoxFormaSuceso.SelectCommand = "SELECT [IDFormaSuceso],[FormaSuceso] FROM [MAccidFormaSuceso] WHERE Idioma='" + Idioma + "' ORDER BY [FormaSuceso]";
            SqlDataSourceComboBoxTipoRiesgo.SelectCommand = "SELECT [IDTipodeRiesgo],[TipoRiesgo] FROM [MAccidTipoRiesgo] WHERE Idioma='" + Idioma + "' ORDER BY [TipoRiesgo]";
            SqlDataSourceComboBoxComboBoxDiaSemana.SelectCommand = "SELECT [IDDia],[Dia] FROM [MdiasSemana] WHERE Idioma='" + Idioma + "' ORDER BY [IDDia]";
            //SqlDataSourceComboBoxEvaluarRiesgos.SelectCommand = "SELECT [IDEvalRiesgo],[EvaluarRiesgo] FROM [MAccidEvaluarRiesgo] WHERE Idioma='" + Idioma + "' ORDER BY [EvaluarRiesgo]";
        }

        protected void ComboBO_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }


        protected void ComboBoxNIFTrabajador_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }


        protected void ComboBoxFechaAccidente_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxHora_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxClasificacion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxConsecuencias_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }


        protected void ComboBoxLugarTrabajo_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxParteLesionada_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxTipoLesion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxActosInseguros_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxCondicionesInseguras_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxFormaSuceso_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxTipoRiesgo_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxEvaluarRiesgos_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        // Eventos

        protected void ComboBO_TextChanged(object sender, EventArgs e)
        {
            CheckComboBO();

        }

        private bool CheckComboBO()
        {
            BBDDCYMIMASA extraerRegistrosCabecera = new BBDDCYMIMASA();
            var invocar = extraerRegistrosCabecera.AccidentesGetXBO(ComboBO.Text, Idioma);
            AccidentesGetXBO_Result resultados;
            try
            {
                resultados = invocar.First();
                TextBoxNBO.Text = resultados.NBO;
                TextBoxCentroOperativo.Text = resultados.NCO;
                TextBoxEmpresa.Text = resultados.NombreEmpresa;
                TextBoxDelegacion.Text = resultados.NDelegacion;
                TextBoxDivision.Text = resultados.NDivision;
                TextBoxFechaRegistro.Text = (DateTime.Today.ToString()).Substring(0, 10);
                BO.BackColor = ColorSinAlerta;
                return true;
            }
            catch (Exception ex)
            {
                TextBoxNBO.Text = string.Empty;
                TextBoxCentroOperativo.Text = string.Empty;
                TextBoxEmpresa.Text = string.Empty;
                TextBoxDelegacion.Text = string.Empty;
                TextBoxDivision.Text = string.Empty;
                TextBoxFechaRegistro.Text = string.Empty;
                BO.BackColor = ColorAlerta;
                return false;
            }
        }

        protected void RadButtonSubcontratistaSi__Click(object sender, EventArgs e)
        {
            SubcontratistaSi();
        }

        protected void SubcontratistaSi()
        {
            NombreSubcontrata.Visible = true;
            ComboBoxNIFTrabajador.Visible = false;
            TextBoxNIFTrabajador.Visible = true;
            TextBoxNombreSubcontrata.Visible = true;
            //TextBoxCategoria.Enabled = true;
            TextBoxApellidos.Enabled = true;
            TextBoxNombre.Enabled = true;

            NIFTrabajador.BackColor = ColorSinAlerta;
        }

        protected void RadButtonSubcontratistaNo__Click(object sender, EventArgs e)
        {
            SubcontratistaNo();
        }

        protected void SubcontratistaNo()
        {
            NombreSubcontrata.Visible = false;
            ComboBoxNIFTrabajador.Visible = true;
            TextBoxNIFTrabajador.Visible = false;
            TextBoxNombreSubcontrata.Visible = false;
            //TextBoxCategoria.Enabled = false;
            TextBoxApellidos.Enabled = false;
            TextBoxNombre.Enabled = false;

            NombreSubcontrata.BackColor = ColorSinAlerta;
            NIFTrabajador.BackColor = ColorSinAlerta;
            Categoria.BackColor = ColorSinAlerta;
            Apellidos.BackColor = ColorSinAlerta;
            Nombre.BackColor = ColorSinAlerta;
        }

        protected void NombreSubcontrata_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxNombreSubcontrata.Text.Length < 4)
            {
                NombreSubcontrata.BackColor = ColorAlerta;
            }
            else
                NombreSubcontrata.BackColor = ColorSinAlerta;
        }

        protected void NIFTrabajador_TextChanged(object sender, EventArgs e)
        {
            CheckNIFTrabajador();
        }


        protected void TextNIFTrabajador_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxNIFTrabajador.Text.Length < 4)
                NIFTrabajador.BackColor = ColorAlerta;
            else
                NIFTrabajador.BackColor = ColorSinAlerta;
        }



        private bool CheckNIFTrabajador()
        {
            if (RadButtonSubcontratistaSi.Checked == true)
            {
                if (TextBoxNIFTrabajador.Text.Length < 4)
                {
                    NIFTrabajador.BackColor = ColorAlerta;
                    return false;
                }
                NIFTrabajador.BackColor = ColorSinAlerta;
                return true;
            }

            else
            {


                //TextBoxNIFTrabajador
                BBDDCYMIMASA extraerRegistrosPersona = new BBDDCYMIMASA();
                var invocar = extraerRegistrosPersona.PersonalGETxNIF(ComboBoxNIFTrabajador.Text, Idioma);
                PersonalGETxNIF_Result resultados;
                try
                {
                    resultados = invocar.First();
                    TextBoxCategoria.Text = resultados.NCategoria;
                    TextBoxApellidos.Text = resultados.Apellidos;
                    TextBoxNombre.Text = resultados.Nombre;
                    TextBoxEdad.Text = Convert.ToString(Utilidades.CalculoAnnos(resultados.FechaNacimiento, DateTime.Today));
                    Edad.BackColor = ColorSinAlerta;
                    NIFTrabajador.BackColor = ColorSinAlerta;
                    return true;
                }
                catch (Exception ex)
                {
                    TextBoxCategoria.Text = string.Empty;
                    TextBoxApellidos.Text = string.Empty;
                    TextBoxNombre.Text = string.Empty;
                    //TextBoxEdad.Text = string.Empty; //resultados.FechaNacimiento;
                    NIFTrabajador.BackColor = ColorAlerta;
                    return false;
                }
            }
        }


        protected void Categoria_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxCategoria.Text.Length < 3)
            {
                Categoria.BackColor = ColorAlerta;
            }
            else
                Categoria.BackColor = ColorSinAlerta;
        }

        protected void Apellidos_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxApellidos.Text.Length < 4)
            {
                Apellidos.BackColor = ColorAlerta;
            }
            else
                Apellidos.BackColor = ColorSinAlerta;
        }

        protected void Nombre_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxNombre.Text.Length < 3)
            {
                Nombre.BackColor = ColorAlerta;
            }
            else
                Nombre.BackColor = ColorSinAlerta;
        }

        protected void TextBoxEdad_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxEdad.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxEdad.Text);
                    if (n < 0 || n > 99)
                        Edad.BackColor = ColorAlerta;
                    else
                        Edad.BackColor = ColorSinAlerta;
                }
                catch (Exception Es)
                {
                    Edad.BackColor = ColorAlerta;
                }
            }
        }

        protected void TextBoxAntiguedad_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxAntiguedad.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxAntiguedad.Text);
                    if (n < 0 || n > 99)
                        Antiguedad.BackColor = ColorAlerta;
                    else
                        Antiguedad.BackColor = ColorSinAlerta;
                }
                catch (Exception Es)
                {
                    Antiguedad.BackColor = ColorSinAlerta;
                }
            }
        }
        protected void InputFechaAccidente_TextChanged(object sender, EventArgs e)
        {
            FechaAccidente.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxDiaSemana_TextChanged(object sender, EventArgs e)
        {
            ComboBoxDiaSemana.Text = string.Empty;
            DiaSemana.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxHora_TextChanged(object sender, EventArgs e)
        {
            ComboBoxHora.Text = string.Empty;
            Hora.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxClasificacion_TextChanged(object sender, EventArgs e)
        {
            ComboBoxClasificacion.Text = string.Empty;
            Clasificacion.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxConsecuencias_TextChanged(object sender, EventArgs e)
        {
            ComboBoxConsecuencias.Text = string.Empty;
            Consecuencias.BackColor = ColorSinAlerta;
        }

        protected void TextBoxDescripcion_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxDescripcion.Text.Length < 2)
            {
                Descripcion.BackColor = ColorAlerta;
            }
            else Descripcion.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxLugarTrabajo_TextChanged(object sender, EventArgs e)
        {
            ComboBoxLugarTrabajo.Text = string.Empty;
            LugarTrabajo.BackColor = ColorSinAlerta;
            if (ComboBoxLugarTrabajo.SelectedValue == "9999")
                TextBoxOtroLugarTrabajo.Visible = true;
            else
                TextBoxOtroLugarTrabajo.Visible = false;
        }


        protected void InputFechaBaja_TextChanged(object sender, EventArgs e)
        {
            //    FechaBaja.BackColor = ColorSinAlerta;
        }

        protected void InputFechaAlta_TextChanged(object sender, EventArgs e)
        {
            //    FechaAlta.BackColor = ColorSinAlerta;
        }

        protected void TextBoxJornadasPerdidas_TextChanged(object sender, EventArgs e)
        {
            //if (TextBoxJornadasPerdidas.Text.Length < 1)
            //{
            //    JornadasPerdidas.BackColor = ColorSinAlerta;
            //    return;
            //}
            JornadasPerdidas.BackColor = ColorSinAlerta;
            if (TextBoxJornadasPerdidas.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxJornadasPerdidas.Text);
                    if (n < 0 || n > 9999)
                    {
                        JornadasPerdidas.BackColor = ColorAlerta;
                        return;
                    }
                }
                catch (Exception Es)
                {
                    JornadasPerdidas.BackColor = ColorAlerta;
                    return;
                }

            }

        }

        protected void ComboBoxParteLesionada_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxParteLesionada.CheckedItems.Count == 0)
                ParteLesionada.BackColor = ColorAlerta;
            else ParteLesionada.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxTipoLesion_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxTipoLesion.CheckedItems.Count == 0)
                TipoLesion.BackColor = ColorAlerta;
            else TipoLesion.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxActosInseguros_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxActosInseguros.CheckedItems.Count == 0)
                ActosInseguros.BackColor = ColorAlerta;
            else ActosInseguros.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxCondicionesInseguras_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxCondicionesInseguras.CheckedItems.Count == 0)
                CondicionesInseguras.BackColor = ColorAlerta;
            else CondicionesInseguras.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxFormaSuceso_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxFormaSuceso.CheckedItems.Count == 0)
                FormaSuceso.BackColor = ColorAlerta;
            else FormaSuceso.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxTipoRiesgo_TextChanged(object sender, EventArgs e)
        {
            if (ComboBoxTipoRiesgo.CheckedItems.Count == 0)
                TipoRiesgo.BackColor = ColorAlerta;
            else TipoRiesgo.BackColor = ColorSinAlerta;
        }

        protected void ComboBoxEvaluarRiesgos_TextChanged(object sender, EventArgs e)
        {
            EvaluarRiesgos.BackColor = ColorSinAlerta;
        }

        protected void Idioma_Click(object sender, EventArgs e)
        {

            if (Idioma == "EN")
            {
                Idioma = "ES";
                Castellano();
            }
            else
            {
                Idioma = "EN";
                Ingles();
            }
            Session["Idioma"] = Idioma;
            CambiaSelect();
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            string scriptstring = "window.print();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "radalert", scriptstring, true);

        }
        protected void Cancelar_Click(object sender, EventArgs e)
        {
            if (Imprimir.Visible == false)
            {
                Response.Redirect("ConsultaAccidentes.aspx");
            }
            else
            {
                string scriptstring = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "radalert", scriptstring, true);
            }
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            //goto saltar;
            bool cCorrecto = true;
            cCorrecto = (cCorrecto & CheckComboBO());
            cCorrecto = (cCorrecto & CheckNIFTrabajador());


            if (RadButtonSubcontratistaSi.Checked == true)
            {
                if (TextBoxNombreSubcontrata.Text.Length < 4)
                {
                    NombreSubcontrata.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
                else
                    NombreSubcontrata.BackColor = ColorSinAlerta;

                if (TextBoxCategoria.Text.Length < 3)
                {
                    Categoria.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
                else
                    Categoria.BackColor = ColorSinAlerta;

                if (TextBoxApellidos.Text.Length < 4)
                {
                    Apellidos.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
                else
                    Apellidos.BackColor = ColorSinAlerta;

                if (TextBoxNombre.Text.Length < 3)
                {
                    Nombre.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
                else
                    Nombre.BackColor = ColorSinAlerta;

            }



            if (TextBoxEdad.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxEdad.Text);
                    if (n < 0 || n > 99)
                        Edad.BackColor = ColorAlerta;
                    else
                        Edad.BackColor = ColorSinAlerta;
                }
                catch (Exception Es)
                {
                    Edad.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
            }

            if (TextBoxAntiguedad.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxAntiguedad.Text);
                    if (n < 0 || n > 99)
                        Antiguedad.BackColor = ColorAlerta;
                    else
                        Antiguedad.BackColor = ColorSinAlerta;
                }
                catch (Exception Es)
                {
                    Antiguedad.BackColor = ColorSinAlerta;
                }
            }

            if (DatePickerFechaAccidente.IsEmpty)
            {
                FechaAccidente.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else DatePickerFechaAccidente.DateInput.BackColor = ColorSinAlerta;

            if (ComboBoxHora.SelectedIndex == -1)
            {
                Hora.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else Hora.BackColor = ColorSinAlerta;

            if (ComboBoxDiaSemana.SelectedIndex == -1)
            {
                DiaSemana.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else DiaSemana.BackColor = ColorSinAlerta;

            if (ComboBoxClasificacion.SelectedIndex == -1)
            {
                Clasificacion.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else Clasificacion.BackColor = ColorSinAlerta;

            if (ComboBoxConsecuencias.SelectedIndex == -1)
            {
                Consecuencias.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else Consecuencias.BackColor = ColorSinAlerta;

            if (TextBoxDescripcion.Text.Length < 2)
            {
                Descripcion.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else Descripcion.BackColor = ColorSinAlerta;

            if (ComboBoxLugarTrabajo.SelectedIndex == -1)
            {
                LugarTrabajo.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else LugarTrabajo.BackColor = ColorSinAlerta;

            //if (DatePickerFechaAlta.IsEmpty)
            //{
            //    FechaAlta.BackColor = ColorAlerta;
            //    cCorrecto = false;
            //}
            //else FechaAlta.BackColor = ColorSinAlerta;

            TextBoxJornadasPerdidas.BackColor = ColorSinAlerta;
            //if (TextBoxJornadasPerdidas.Text.Length < 1)
            //{
            //    JornadasPerdidas.BackColor = ColorAlerta;
            //    cCorrecto = false;
            //}
            if (TextBoxJornadasPerdidas.Text != string.Empty)
            {
                try
                {
                    int n = Convert.ToInt32(TextBoxJornadasPerdidas.Text);
                    if (n < 0 || n > 1000)
                    {
                        JornadasPerdidas.BackColor = ColorAlerta;
                        cCorrecto = false;
                    }
                }
                catch (Exception Es)
                {
                    JornadasPerdidas.BackColor = ColorAlerta;
                    cCorrecto = false;
                }
            }


            if (ComboBoxParteLesionada.CheckedItems.Count == 0)
            {
                ParteLesionada.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else ParteLesionada.BackColor = ColorSinAlerta;

            if (ComboBoxTipoLesion.CheckedItems.Count == 0)
            {
                TipoLesion.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else TipoLesion.BackColor = ColorSinAlerta;

            if (ComboBoxActosInseguros.CheckedItems.Count == 0)
            {
                ActosInseguros.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else ActosInseguros.BackColor = ColorSinAlerta;

            if (ComboBoxCondicionesInseguras.CheckedItems.Count == 0)
            {
                CondicionesInseguras.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else CondicionesInseguras.BackColor = ColorSinAlerta;


            if (ComboBoxFormaSuceso.CheckedItems.Count == 0)
            {
                FormaSuceso.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else FormaSuceso.BackColor = ColorSinAlerta;

            if (ComboBoxTipoRiesgo.CheckedItems.Count == 0)
            {
                TipoRiesgo.BackColor = ColorAlerta;
                cCorrecto = false;
            }
            else TipoRiesgo.BackColor = ColorSinAlerta;


            if (!cCorrecto) return;


        saltar:

            string DBO = ComboBO.Text;
            DateTime DFechaRegistro = Convert.ToDateTime(TextBoxFechaRegistro.Text.Substring(0, 10));

            int DSubcontratista;
            string DNIFTrabajador;
            if (RadButtonSubcontratistaSi.Checked == true)
            {

                DSubcontratista = 1;
                DNIFTrabajador = TextBoxNIFTrabajador.Text;
            }
            else
            {
                DSubcontratista = 0;
                DNIFTrabajador = ComboBoxNIFTrabajador.Text;
            }

            string DNombreSubcontrata = TextBoxNombreSubcontrata.Text;
            string DApellidos = TextBoxApellidos.Text;
            string DNombre = TextBoxNombre.Text;
            string DCategoria = TextBoxCategoria.Text;
            string DPuestoTrabajo = TextBoxPuestoTrabajo.Text;
            string DTrabajoRealizaba = TextBoxTrabajoRealizaba.Text;
            string DExperienciaPuesto = TexBoxExperienciaPuesto.Text;
            int? DAntiguedad = null;
            if (TextBoxAntiguedad.Text != string.Empty) DAntiguedad = Convert.ToInt32(TextBoxAntiguedad.Text);
            string DMandoSuperior = TextBoxMandoSuperior.Text;
            DateTime DFechaAccidente = Convert.ToDateTime(DatePickerFechaAccidente.DateInput.Text.Substring(0, 10));
            int DHora = Convert.ToInt32(ComboBoxHora.SelectedValue);
            int DDiaSemana = Convert.ToInt32(ComboBoxDiaSemana.SelectedValue);
            int DTrabajoHabitual;
            if (RadButtonTrabajoHabitualSi.Checked == true)
                DTrabajoHabitual = 1;
            else
                DTrabajoHabitual = 0;
            int DClasificacion = Convert.ToInt32(ComboBoxClasificacion.SelectedValue);
            DateTime? DFechaBaja = null;
            if (DatePickerFechaBaja.DateInput.Text != string.Empty) DFechaBaja = Convert.ToDateTime(DatePickerFechaAlta.DateInput.Text.Substring(0, 10));
            DateTime? DFechaAlta = null;
            if (DatePickerFechaAlta.DateInput.Text != string.Empty) DFechaAlta = Convert.ToDateTime(DatePickerFechaAlta.DateInput.Text.Substring(0, 10));
            int? DJornadasPerdidas = null;
            if (TextBoxJornadasPerdidas.Text != string.Empty) DJornadasPerdidas = Convert.ToInt32(TextBoxJornadasPerdidas.Text);
            int DLugardeTrabajo = Convert.ToInt32(ComboBoxLugarTrabajo.SelectedValue);
            string DOtroLugarTrabajo = null;
            if (TextBoxOtroLugarTrabajo.Visible) DOtroLugarTrabajo = TextBoxOtroLugarTrabajo.Text;
            int DConsencuencias = Convert.ToInt32(ComboBoxConsecuencias.SelectedValue);
            int? DEdad = null;
            if (TextBoxEdad.Text != string.Empty) DEdad = Convert.ToInt32(TextBoxEdad.Text);
            string DDescripcion = TextBoxDescripcion.Text;
            string DParteLesionada = Utilidades.CheckedItemsToString(ComboBoxParteLesionada);
            string DTipoLesion = Utilidades.CheckedItemsToString(ComboBoxTipoLesion);
            string DActosInseguros = Utilidades.CheckedItemsToString(ComboBoxActosInseguros);
            string DCondicionesInseguras = Utilidades.CheckedItemsToString(ComboBoxCondicionesInseguras);
            string DFormaSuceso = Utilidades.CheckedItemsToString(ComboBoxFormaSuceso);
            string DTipoRiesgo = Utilidades.CheckedItemsToString(ComboBoxTipoRiesgo);

            int DIdentificadoRiesgoEvaluacion;
            if (RadButtonIdentificadoRiesgoEvaluacionSi.Checked == true)
                DIdentificadoRiesgoEvaluacion = 1;
            else
                DIdentificadoRiesgoEvaluacion = 0;

            int DEvaluarRiesgos;
            if (RadButtonEvaluarRiesgosSi.Checked == true)
                DEvaluarRiesgos = 1;
            else
                DEvaluarRiesgos = 0;

            int DFormadoInformadoRiesgo;
            if (RadButtonFormadoInformadoRiesgoSi.Checked == true)
                DFormadoInformadoRiesgo = 1;
            else
                DFormadoInformadoRiesgo = 0;

            int DEquiposProteccionDefinidosActividad;
            if (RadButtonEquiposProteccionDefinidosActividadSi.Checked == true)
                DEquiposProteccionDefinidosActividad = 1;
            else
                DEquiposProteccionDefinidosActividad = 0;

            int DSeevacuoelaccidentadorapidaycorrectamente;
            if (RadButtonSeevacuoelaccidentadorapidaycorrectamenteSi.Checked == true)
                DSeevacuoelaccidentadorapidaycorrectamente = 1;
            else
                DSeevacuoelaccidentadorapidaycorrectamente = 0;

            int DAtendidoAmbulanciaServiciosdeUrgencia;
            if (RadButtonAtendidoAmbulanciaServiciosdeUrgenciaSi.Checked == true)
                DAtendidoAmbulanciaServiciosdeUrgencia = 1;
            else
                DAtendidoAmbulanciaServiciosdeUrgencia = 0;

            int DConsecuenciaRiesgoElectricoAltura;
            if (RadButtonConsecuenciaRiesgoElectricoAlturaSi.Checked == true)
                DConsecuenciaRiesgoElectricoAltura = 1;
            else
                DConsecuenciaRiesgoElectricoAltura = 0;

            int DExisteProcedimientoTrabajoActividad;
            if (RadButtonExisteProcedimientoTrabajoActividadSi.Checked == true)
                DExisteProcedimientoTrabajoActividad = 1;
            else
                DExisteProcedimientoTrabajoActividad = 0;

            string DEquipoInvestigacion1Apellidos = TextBoxEquipoInvestigacion1Apellidos.Text;
            string DEquipoInvestigacion1Nombre = TextBoxEquipoInvestigacion1Nombre.Text;
            string DEquipoInvestigacion1PuestoTrabajo = TextBoxEquipoInvestigacion1PuestoTrabajo.Text;
            string DEquipoInvestigacion2Apellidos = TextBoxEquipoInvestigacion2Apellidos.Text;
            string DEquipoInvestigacion2Nombre = TextBoxEquipoInvestigacion2Nombre.Text;
            string DEquipoInvestigacion2PuestoTrabajo = TextBoxEquipoInvestigacion2PuestoTrabajo.Text;
            string DEquipoInvestigacion3Apellidos = TextBoxEquipoInvestigacion3Apellidos.Text;
            string DEquipoInvestigacion3Nombre = TextBoxEquipoInvestigacion3Nombre.Text;
            string DEquipoInvestigacion3PuestoTrabajo = TextBoxEquipoInvestigacion3PuestoTrabajo.Text;
            string DUsuarioCreador = "Victor";
            string DUsuarioModificador1 = "Oscar Cejudo";

            DateTime DFecha = DateTime.Now;

            //string DBO = "10001UB";
            //DateTime DFechaRegistro = Convert.ToDateTime("30-06-2013") ;
            //int DSubcontratista = 1;
            //string DNombreSubcontrata = "Waup";
            //string DNIFTrabajador = "28927738V";
            //string DApellidos = "González Fernández";
            //string DNombre = "Víctor Jesús";
            //int DCategoria = 1;
            //string DPuestoTrabajo = "Arquitecto Informático";
            //string DTrabajoRealizaba = "Intranet Cymimasa";
            //string DExperienciaPuesto = "Sobrada experiencia en multitud de intranet similares";
            //int DAntiguedad = 1;
            //string DMandoSuperior = "Andrés García";
            //DateTime DFechaAccidente = Convert.ToDateTime("28-06-2013");
            //int DHora = 3;
            //int DDiaSemana = 2;
            //int DTrabajoHabitual = 1;
            //int DClasificacion = 1;
            //DateTime DFechaBaja = Convert.ToDateTime("28-06-2013");
            //DateTime DFechaAlta = Convert.ToDateTime("20-07-2013");
            //int DJornadasPerdidas = 22;
            //int DLugardeTrabajo = 9999;
            //string DOtroLugarTrabajo = "Sus instalaciones";
            //int DConsencuencias = 1;
            //int DEdad = 41;
            //string DDescripcion = "Caida por escaleras dentro de sus instalaciones cuando bajaba de la planta de arriba para reiniciar una maquina";
            //string DParteLesionada = "1;4";
            //string DTipoLesion = "1;2";
            //string DActosInseguros = "3";
            //string DCondicionesInseguras = "2";
            //string DFormaSuceso = "2;4";
            //string DTipoRiesgo = "2";
            //int DIdentificadoRiesgoEvaluacion = 1;
            //int DEvaluarRiesgos = 1;
            //int DFormadoInformadoRiesgo = 0;
            //int DEquiposProteccionDefinidosActividad = 0;
            //int DSeevacuoelaccidentadorapidaycorrectamente = 1;
            //int DAtendidoAmbulanciaServiciosdeUrgencia = 1;
            //int DConsecuenciaRiesgoElectricoAltura = 0;
            //int DExisteProcedimientoTrabajoActividad = 0;
            //string DEquipoInvestigacion1Apellidos = "Ruiz García";
            //string DEquipoInvestigacion1Nombre = "Susana";
            //string DEquipoInvestigacion1PuestoTrabajo = "Delegación Centro";
            //string DEquipoInvestigacion2Apellidos = "Cejudo";
            //string DEquipoInvestigacion2Nombre = "Oscar";
            //string DEquipoInvestigacion2PuestoTrabajo = "Prevención Riesgos Laborales";
            //string DEquipoInvestigacion3Apellidos = "García-Baltasar Romero";
            //string DEquipoInvestigacion3Nombre = "Andrés";
            //string DEquipoInvestigacion3PuestoTrabajo = "Jefe Sistemas Información";
            //string DUsuarioCreador = "Susana Ruiz";
            //string DUsuarioModificador1 = "Oscar Cejudo";
            //DateTime DFecha = Convert.ToDateTime("30-06-2013 11:21:16");

            BBDDCYMIMASA Guardar = new BBDDCYMIMASA();
            if (TextBoxCodigo.Text == string.Empty)
            {
                var invocar = Guardar.AccidentesCrear(DBO, DFechaRegistro, DSubcontratista, DNombreSubcontrata, DNIFTrabajador, DApellidos, DNombre, DCategoria, DPuestoTrabajo, DTrabajoRealizaba, DExperienciaPuesto, DAntiguedad,
DMandoSuperior, DFechaAccidente, DHora, DDiaSemana, DTrabajoHabitual, DClasificacion, DFechaBaja, DFechaAlta, DJornadasPerdidas, DLugardeTrabajo, DOtroLugarTrabajo, DConsencuencias, DEdad, DDescripcion,
DParteLesionada, DTipoLesion, DActosInseguros, DCondicionesInseguras, DFormaSuceso, DTipoRiesgo, DIdentificadoRiesgoEvaluacion, DEvaluarRiesgos, DFormadoInformadoRiesgo, DEquiposProteccionDefinidosActividad, DSeevacuoelaccidentadorapidaycorrectamente, DAtendidoAmbulanciaServiciosdeUrgencia, DConsecuenciaRiesgoElectricoAltura, DExisteProcedimientoTrabajoActividad, DEquipoInvestigacion1Apellidos, DEquipoInvestigacion1Nombre, DEquipoInvestigacion1PuestoTrabajo, DEquipoInvestigacion2Apellidos, DEquipoInvestigacion1Nombre, DEquipoInvestigacion2PuestoTrabajo, DEquipoInvestigacion3Apellidos, DEquipoInvestigacion3Nombre, DEquipoInvestigacion3PuestoTrabajo, DUsuarioCreador, DUsuarioModificador1, DFecha);
            }

            else
            {
                var invocar = Guardar.AccidentesModificar(Convert.ToInt32(TextBoxCodigo.Text), DBO, DFechaRegistro, DSubcontratista, DNombreSubcontrata, DNIFTrabajador, DApellidos, DNombre, DCategoria, DPuestoTrabajo, DTrabajoRealizaba, DExperienciaPuesto, DAntiguedad,
DMandoSuperior, DFechaAccidente, DHora, DDiaSemana, DTrabajoHabitual, DClasificacion, DFechaBaja, DFechaAlta, DJornadasPerdidas, DLugardeTrabajo, DOtroLugarTrabajo, DConsencuencias, DEdad, DDescripcion,
DParteLesionada, DTipoLesion, DActosInseguros, DCondicionesInseguras, DFormaSuceso, DTipoRiesgo, DIdentificadoRiesgoEvaluacion, DEvaluarRiesgos, DFormadoInformadoRiesgo, DEquiposProteccionDefinidosActividad, DSeevacuoelaccidentadorapidaycorrectamente, DAtendidoAmbulanciaServiciosdeUrgencia, DConsecuenciaRiesgoElectricoAltura, DExisteProcedimientoTrabajoActividad, DEquipoInvestigacion1Apellidos, DEquipoInvestigacion1Nombre, DEquipoInvestigacion1PuestoTrabajo, DEquipoInvestigacion2Apellidos, DEquipoInvestigacion1Nombre, DEquipoInvestigacion2PuestoTrabajo, DEquipoInvestigacion3Apellidos, DEquipoInvestigacion3Nombre, DEquipoInvestigacion3PuestoTrabajo, DUsuarioCreador, DUsuarioModificador1, DFecha);
            }

            if (Imprimir.Visible == false)
            {
                Response.Redirect("ConsultaAccidentes.aspx");
            }
            else
            {
                string scriptstring = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "radalert", scriptstring, true);
            }
        }

        public void Castellano()
        {
            Codigo.Text = "Código";
            BO.Text = "B.O.";
            NBO.Text = "N.B.O.";
            FechaRegistro.Text = "Fecha Registro";
            CentroOperativo.Text = "Centro Operativo";
            Empresa.Text = "Empresa";
            Delegacion.Text = "Delegación";
            Division.Text = "División";
            Subcontratista.Text = "Subcontratista";
            NIFTrabajador.Text = "N.I.F.";
            Apellidos.Text = "Apellidos";
            Nombre.Text = "Nombre";
            Categoria.Text = "Categoría";
            PuestoTrabajo.Text = "Puesto de Trabajo";
            TrabajoRealizaba.Text = "Trabajo que Realizaba";
            ExperienciaPuesto.Text = "Experiencia en el Puesto";
            Antiguedad.Text = "Antiguedad";
            MandoSuperior.Text = "Mando Superior";
            FechaAccidente.Text = "Fecha Accidente";
            Hora.Text = "Hora";
            DiaSemana.Text = "Día de la Semana";
            TrabajoHabitual.Text = "Trabajo Habitual";
            Clasificacion.Text = "Clasificación";
            FechaBaja.Text = "Fecha de Baja";
            FechaAlta.Text = "Fecha de Alta";
            JornadasPerdidas.Text = "Jornadas Perdidas";
            LugarTrabajo.Text = "Lugar de Trabajo";
            Consecuencias.Text = "Consecuencias";
            Edad.Text = "Age";
            Descripcion.Text = "Descripción";
            ParteLesionada.Text = "Parte Lesionada";
            TipoLesion.Text = "Tipo Lesion";
            ActosInseguros.Text = "Actos Inseguros";
            CondicionesInseguras.Text = "Cond. Inseguras";
            FormaSuceso.Text = "Forma Suceso";
            TipoRiesgo.Text = "Tipo Riesgo";
            EquipoInvestigacion.Text = "Equipo Investigación";
            NuevoAccidente.Text = "Nuevo Accidente";
            DatosGenerales.Text = "Datos Generales del Informe";
            DatosAccidentado.Text = "Datos del Trabajador Accidentado";
            DatosAccidente.Text = "Datos Accidente";
            AccionesCorrectoras.Text = "Acciones Correctoras";
            ArchivosAdjuntos.Text = "Archivos Adjuntos";
            EquipoInvestigacion.Text = "EquipoInvestigacion";
            EquipoInvestigacionApellidos.Text = "Apellidos";
            EquipoInvestigacionNombre.Text = "Nombre";
            EquipoInvestigacionPuestoTrabajo.Text = "Puesto de Trabajo";
            Cuestiones.Text = "Cuestiones";
            IdentificadoRiesgoEvaluacion.Text = "¿Identificado el Riesgo en la Evaluación?";
            EvaluarRiesgos.Text = "¿Revisar la Evaluación de Riesgos?";
            FormadoInformadoRiesgo.Text = "¿Se encuentra correctamente formado e informado del Riesgo?";
            EquiposProteccionDefinidosActividad.Text = "¿Lleva todos los equipos de protección definidos para la actividad?";
            Seevacuoelaccidentadorapidaycorrectamente.Text = "¿Se evacuó el accidentado rápida y correctamente?";
            AtendidoAmbulanciaServiciosdeUrgencia.Text = "¿Tuvo que ser atendido por Ambulancia o Servicios de Urgencia?";
            ConsecuenciaRiesgoElectricoAltura.Text = "¿Se produce por consecuencia del Riesgo Eléctrico y/o Altura?";
            ExisteProcedimientoTrabajoActividad.Text = "¿Existe procedimiento de trabajo que describa la Actividad?";




        }
        public void Ingles()
        {
            Codigo.Text = "Code";
            BO.Text = "B.O.";
            NBO.Text = "N.B.O.";
            FechaRegistro.Text = "Registration Date";

            CentroOperativo.Text = "Operating Center";
            Empresa.Text = "Company";
            Delegacion.Text = "Delegation";
            Division.Text = "Division";
            Subcontratista.Text = "Subcontractor";
            NIFTrabajador.Text = "N.I.F.";
            Apellidos.Text = "Surnames";
            Nombre.Text = "Name";
            Categoria.Text = "Category";
            PuestoTrabajo.Text = "Workstation";
            TrabajoRealizaba.Text = "Work he did";
            ExperienciaPuesto.Text = "Job Experience";
            Antiguedad.Text = "Antiquity";
            MandoSuperior.Text = "Higher Command";
            FechaAccidente.Text = "Date Accident";
            Hora.Text = "Time";
            DiaSemana.Text = "Weekday";
            TrabajoHabitual.Text = "Usual Job";
            Clasificacion.Text = "Clasification";
            FechaBaja.Text = "Date of Lower";
            FechaAlta.Text = "Date of Added";
            JornadasPerdidas.Text = "Lost Days";
            LugarTrabajo.Text = "Workplace";
            Consecuencias.Text = "Impact";
            Edad.Text = "Age";
            Descripcion.Text = "Description";
            ParteLesionada.Text = "Injured Area";
            TipoLesion.Text = "Type of Injury";
            ActosInseguros.Text = "Unsafe Acts";
            CondicionesInseguras.Text = "Unsafe Conditions";
            FormaSuceso.Text = "Event Form";
            TipoRiesgo.Text = "Risk Type";
            EquipoInvestigacion.Text = "Research Team";
            NuevoAccidente.Text = "New Accident";
            DatosGenerales.Text = "General Information";
            DatosAccidentado.Text = "Employee Data Accident";
            DatosAccidente.Text = "Accident Data";
            AccionesCorrectoras.Text = "Corrective Actions";
            ArchivosAdjuntos.Text = "Attachments";
            EquipoInvestigacion.Text = "Research Team";
            EquipoInvestigacionApellidos.Text = "Surnames";
            EquipoInvestigacionNombre.Text = "Name";
            EquipoInvestigacionPuestoTrabajo.Text = "Workstation";
            Cuestiones.Text = "Questions";
            IdentificadoRiesgoEvaluacion.Text = "Identified Risk Assessment?";
            EvaluarRiesgos.Text = "Review the evaluationof Risk?";
            FormadoInformadoRiesgo.Text = "Is properly trained and informed of the risk?";
            EquiposProteccionDefinidosActividad.Text = "Do you take all protective equipment defined for the activity?";
            Seevacuoelaccidentadorapidaycorrectamente.Text = "Does the injured evacuated quickly and correctly?";
            AtendidoAmbulanciaServiciosdeUrgencia.Text = "Did you have to be attended to by Ambulance or Emergency Services?";
            ConsecuenciaRiesgoElectricoAltura.Text = "Is it produced in consequence of Electrical Risk and / or height?";
            ExisteProcedimientoTrabajoActividad.Text = "Does working procedure describing the activity?";
        }


        public void LeerAccidente(string Codigo)
        {
            BBDDCYMIMASA Leer = new BBDDCYMIMASA();

            var invocar = Leer.AccidentesLeer(Convert.ToInt32(Codigo));
            AccidentesLeer_Result r;

            r = invocar.First();
            TextBoxCodigo.Text = r.Codigo.ToString();
            ComboBO.Text = r.BO;
            CheckComboBO();
            TextBoxFechaRegistro.Text = r.FechaRegistro.ToString().Substring(0, 10);
            if (r.Subcontratista == 1)
            {
                RadButtonSubcontratistaSi.Checked = true;
                SubcontratistaSi();
            }
            else
            {
                RadButtonSubcontratistaNo.Checked = true;
                SubcontratistaNo();
            }

            TextBoxNombreSubcontrata.Text = r.NombreSubcontrata;
            ComboBoxNIFTrabajador.Text = r.NIFTrabajador;
            TextBoxNIFTrabajador.Text = ComboBoxNIFTrabajador.Text;

            TextBoxApellidos.Text = r.Apellidos;
            TextBoxNombre.Text = r.Nombre;
            TextBoxCategoria.Text = r.Categoria;
            TextBoxPuestoTrabajo.Text = r.PuestoTrabajo;
            TextBoxTrabajoRealizaba.Text = r.TrabajoRealizaba;
            TexBoxExperienciaPuesto.Text = r.ExperienciaPuesto;
            TextBoxAntiguedad.Text = r.Antiguedad.ToString();
            TextBoxMandoSuperior.Text = r.MandoSuperior;

            DatePickerFechaAccidente.SelectedDate = System.DateTime.Parse(r.FechaAccidente.ToString().Substring(0, 10));
            ComboBoxHora.SelectedValue = r.Hora.ToString();
            ComboBoxDiaSemana.SelectedValue = r.DiaSemana.ToString();
            if (r.TrabajoHabitual == 1) RadButtonTrabajoHabitualSi.Checked = true; else RadButtonTrabajoHabitualNo.Checked = true;
            ComboBoxClasificacion.SelectedValue = r.Clasificacion.ToString();
            if (r.FechaBaja != null) DatePickerFechaBaja.SelectedDate = System.DateTime.Parse(r.FechaBaja.ToString().Substring(0, 10));
            if (r.FechaAlta != null) DatePickerFechaAlta.SelectedDate = System.DateTime.Parse(r.FechaAlta.ToString().Substring(0, 10));
            TextBoxJornadasPerdidas.Text = r.JornadasPerdidas.ToString();
            ComboBoxLugarTrabajo.SelectedValue = r.LugardeTrabajo.ToString();
            if (ComboBoxLugarTrabajo.SelectedValue == "9999") TextBoxOtroLugarTrabajo.Visible = true;
            TextBoxOtroLugarTrabajo.Text = r.OtroLugarTtrabajo;





            ComboBoxConsecuencias.SelectedValue = r.Consecuencias.ToString();
            TextBoxEdad.Text = r.Edad.ToString();
            TextBoxDescripcion.Text = r.Descripcion;
            Utilidades.StringToItemsChecked(r.ParteLesionada, ComboBoxParteLesionada);
            Utilidades.StringToItemsChecked(r.TipoLesion, ComboBoxTipoLesion);
            Utilidades.StringToItemsChecked(r.ActosInseguros, ComboBoxActosInseguros);
            Utilidades.StringToItemsChecked(r.CondicionesInseguras, ComboBoxCondicionesInseguras);
            Utilidades.StringToItemsChecked(r.FormaSuceso, ComboBoxFormaSuceso);
            Utilidades.StringToItemsChecked(r.TipoRiesgo, ComboBoxTipoRiesgo);
            if (r.IdentificadoRiesgoEvaluacion == 1) RadButtonIdentificadoRiesgoEvaluacionSi.Checked = true; else RadButtonIdentificadoRiesgoEvaluacionNo.Checked = true;
            if (r.EvaluarRiesgos == 1) RadButtonEvaluarRiesgosSi.Checked = true; else RadButtonEvaluarRiesgosNo.Checked = true;
            if (r.FormadoInformadoRiesgo == 1) RadButtonFormadoInformadoRiesgoSi.Checked = true; else RadButtonFormadoInformadoRiesgoNo.Checked = true;
            if (r.EquiposProteccionDefinidosActividad == 1) RadButtonEquiposProteccionDefinidosActividadSi.Checked = true; else RadButtonEquiposProteccionDefinidosActividadNo.Checked = true;
            if (r.Seevacuoelaccidentadorapidaycorrectamente == 1) RadButtonSeevacuoelaccidentadorapidaycorrectamenteSi.Checked = true; else RadButtonSeevacuoelaccidentadorapidaycorrectamenteNo.Checked = true;
            if (r.AtendidoAmbulanciaServiciosdeUrgencia == 1) RadButtonAtendidoAmbulanciaServiciosdeUrgenciaSi.Checked = true; else RadButtonAtendidoAmbulanciaServiciosdeUrgenciaNo.Checked = true;
            if (r.ConsecuenciaRiesgoElectricoAltura == 1) RadButtonConsecuenciaRiesgoElectricoAlturaSi.Checked = true; else RadButtonConsecuenciaRiesgoElectricoAlturaNo.Checked = true;
            if (r.ExisteProcedimientoTrabajoActividad == 1) RadButtonExisteProcedimientoTrabajoActividadSi.Checked = true; else RadButtonExisteProcedimientoTrabajoActividadNo.Checked = true;
            TextBoxEquipoInvestigacion1Apellidos.Text = r.EquipoInvestigacion1Apellidos;
            TextBoxEquipoInvestigacion1Nombre.Text = r.EquipoInvestigacion1Nombre;
            TextBoxEquipoInvestigacion1PuestoTrabajo.Text = r.EquipoInvestigacion1PuestoTrabajo;
            TextBoxEquipoInvestigacion2Apellidos.Text = r.EquipoInvestigacion2Apellidos;
            TextBoxEquipoInvestigacion2Nombre.Text = r.EquipoInvestigacion2Nombre;
            TextBoxEquipoInvestigacion2PuestoTrabajo.Text = r.EquipoInvestigacion2PuestoTrabajo;
            TextBoxEquipoInvestigacion3Apellidos.Text = r.EquipoInvestigacion3Apellidos;
            TextBoxEquipoInvestigacion3Nombre.Text = r.EquipoInvestigacion3Nombre;
            TextBoxEquipoInvestigacion3PuestoTrabajo.Text = r.EquipoInvestigacion3PuestoTrabajo;


            //string DUsuarioCreador = "Victor";
            //string DUsuarioModificador1 = "Oscar Cejudo";

            //DateTime DFecha = DateTime.Now;
        }
    }
}