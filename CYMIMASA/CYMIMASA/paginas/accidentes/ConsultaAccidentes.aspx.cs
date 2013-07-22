using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Text;


namespace CYMIMASA.paginas.accidentes
{
    public partial class ConsultaAccidentes : System.Web.UI.Page
    {
        public string Idioma = "ES";
        public string AbrirVentana = "openPopUp();";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["Buscar"] != null) SqlDataSourceTablaConsultaAccidentes.SelectCommand = (string)Session["Buscar"];



            if (!Page.IsPostBack)
            {


                SqlDataSourceComboDivision.SelectCommand = "SELECT [IDDivision],[NDivision] FROM [MDivision] WHERE Idioma='" + Idioma + "' ORDER BY [NDivision]";
                SqlDataSourceComboDelegacion.SelectCommand = string.Empty;

                SqlDataSourceComboClasificacion.SelectCommand = "SELECT [IDClasifAccid],[ClasificacionAccidente] FROM [MAccidClasificacionAccidente] WHERE Idioma='" + Idioma + "' ORDER BY [ClasificacionAccidente]";
                SqlDataSourceComboBoxNIFTrabajador.SelectCommand = "SELECT [NIFTrabajador] FROM [MPersonal] ORDER BY [NIFTrabajador]";

                //TablaConsultaAccidentes.SelectedIndexes.Add(0);
                //SqlDataSourceTablaConsultaAccidentes.SelectParameters.Add("Idioma", "ES");
                //SqlDataSourceTablaConsultaAccidentes.SelectCommand = "AccidentesConsulta";
                //SelectCommandType="StoredProcedure"

            }
        }
        /*
SELECT CC,NDelegacion
FROM MDivision

INNER JOIN MDelegacion ON MDelegacion.Division=Division

WHERE IDDivision=2 AND MDivision.Idioma='ES' AND MDelegacion.Idioma='ES'
         */
        protected void ComboDivision_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboDelegacion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {

        }

        protected void ComboClasificacion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {

        }

        protected void ComboBoxNIFTrabajador_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {


        }

        protected void TablaConsultaAccidentes_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                item["FechaAccidente"].Text = item["FechaAccidente"].Text.ToString().Substring(0, 10);
            }
        }

        protected void ComboBoxDivision_TextChanged(object sender, EventArgs e)
        {
            if (ComboDivision.SelectedValue != string.Empty)
            {
                SqlDataSourceComboDelegacion.SelectCommand = "SELECT [CC],[NDelegacion] FROM [MDelegacion] INNER JOIN MDivision ON MDelegacion.Division=MDivision.IDDivision WHERE MDivision.Idioma='" + Idioma + "' AND MDelegacion.Idioma='" + Idioma + "' AND MDelegacion.Division=" + ComboDivision.SelectedValue + "   ORDER BY [NDelegacion]";
                ComboDelegacion.ClearSelection();
                ComboDelegacion.Text = string.Empty;
            }
        }

        protected void BotonBuscar_Click(object sender, EventArgs e)
        {
            // B de Buscar
            StringBuilder B = new StringBuilder();
            B.Append("SELECT Codigo AS Código,TAccidentes.BO,MCentrosOperativos.NCO AS NombreCO,NDelegacion AS Delegación,ClasificacionAccidente AS Clasif_Accidente,NIFTrabajador,FechaAccidente ");
            B.Append("FROM TAccidentes ");
            B.Append("INNER JOIN MBO ON TAccidentes.BO=MBO.BO ");
            B.Append("INNER JOIN MCentrosOperativos ON MBO.CO=MCentrosOperativos.IDCO ");
            B.Append("INNER JOIN MDelegacion ON MCentrosOperativos.CC=MDelegacion.CC ");
            B.Append("INNER JOIN MAccidClasificacionAccidente ON Clasificacion=MAccidClasificacionAccidente.IDClasifAccid ");
            B.Append("INNER JOIN MDivision ON MDelegacion.Division=MDivision.IDDivision ");

            B.Append("WHERE  MDivision.Idioma='" + Idioma + "' AND MCentrosOperativos.Idioma='" + Idioma + "' AND MDelegacion.Idioma='" + Idioma + "' AND MAccidClasificacionAccidente.Idioma='" + Idioma + "' ");

            if (ComboBoxNIFTrabajador.Text != string.Empty)
                B.Append("AND NIFTrabajador='" + ComboBoxNIFTrabajador.Text + "' ");

            if (ComboDivision.SelectedIndex != -1)
                B.Append("AND IDDivision=" + ComboDivision.SelectedValue + " ");

            if (ComboDelegacion.SelectedIndex != -1)
                B.Append("AND MDelegacion.CC=" + ComboDelegacion.SelectedValue + " ");

            if (ComboClasificacion.SelectedIndex != -1)
                B.Append("AND IDClasifAccid=" + ComboClasificacion.SelectedValue + " ");

            if (!DatePickerFechaAccidenteDesde.IsEmpty)
                B.Append("AND FechaAccidente>='" + DatePickerFechaAccidenteDesde.DateInput.Text.Substring(0, 10) + "' ");

            if (!DatePickerFechaAccidenteHasta.IsEmpty)
                B.Append("AND FechaAccidente<='" + DatePickerFechaAccidenteHasta.DateInput.Text.Substring(0, 10) + "' ");

            SqlDataSourceTablaConsultaAccidentes.SelectCommand = B.ToString();

            Session["Buscar"] = B.ToString();


        }

        protected void BotonLimpiar_Click(object sender, EventArgs e)
        {
            ComboBoxNIFTrabajador.ClearSelection();
            ComboBoxNIFTrabajador.Text = string.Empty;
            DatePickerFechaAccidenteDesde.Clear();
            DatePickerFechaAccidenteHasta.Clear();

            ComboDelegacion.ClearSelection();
            SqlDataSourceComboDelegacion.SelectCommand = string.Empty;
            ComboDelegacion.Text = string.Empty;

            ComboClasificacion.ClearSelection();
            ComboClasificacion.Text = string.Empty;

            ComboDivision.ClearSelection();
            ComboDivision.Text = string.Empty;

            SqlDataSourceTablaConsultaAccidentes.SelectCommand = string.Empty;
            TablaConsultaAccidentes.Rebind();
            Session["Buscar"] = null;
        }

        protected void TablaConsultaAccidentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dataItem = TablaConsultaAccidentes.SelectedItems[0] as GridDataItem;
            if (dataItem != null)
            {
                string codigo = dataItem["Código"].Text;

                //Se genera el código javascript que se quiere ejecutar

                //ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: alert('Se guardaron los datos satisfactoriamente');</script>");


                //string scriptstring = "radalert('Welcome to Rad<strong>Window</strong>!', 330, 210);";

                string scriptstring = @"window.open('Accidente.aspx?Codigo=" + codigo + "', 'Editar Accidente', 'width=870px, height=700px, resizable=1, scrollbars=1, toolbar=1, status=0, directories=0, copyhistory=0');";

                //string scriptstring = "radopen('Accidente.aspx?Codigo=" + codigo + "','RadWindow1');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "radalert", scriptstring, true);

            }
        }

        protected void TablaConsultaAccidentes_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName ||
            e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
            e.CommandName == Telerik.Web.UI.RadGrid.ExportToCsvCommandName ||
            e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
            {
                TablaConsultaAccidentes.ExportSettings.ExportOnlyData = true;
                TablaConsultaAccidentes.ExportSettings.IgnorePaging = true;
                TablaConsultaAccidentes.ExportSettings.OpenInNewWindow = true;
                //TablaConsultaAccidentes.ExportSettings.UseItemStyles = true;
            }

            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName)
            {
                //TablaConsultaAccidentes.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Biff;
                TablaConsultaAccidentes.MasterTableView.ExportToExcel();
            }

            else

                if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                {
                   // TablaConsultaAccidentes.ExportSettings.Excel.Format = Telerik.Web.UI.GridPdfSettings=;
                    TablaConsultaAccidentes.MasterTableView.ExportToPdf();
                }
                else
                    if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName)
                    {
                        //TablaConsultaAccidentes.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Biff;
                        TablaConsultaAccidentes.MasterTableView.ExportToWord();
                    }
                    else
                        if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToCsvCommandName)
                        {
                            //TablaConsultaAccidentes.ExportSettings.Excel.Format = Telerik.Web.UI.GridExcelExportFormat.Biff;
                            TablaConsultaAccidentes.MasterTableView.ExportToCSV();
                        }

        }

    }

}
