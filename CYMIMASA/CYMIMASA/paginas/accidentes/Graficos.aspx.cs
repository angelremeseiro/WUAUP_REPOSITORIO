using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

using System.Data;
using System.Text;


namespace CYMIMASA.paginas.accidentes
{
    public partial class Graficos : System.Web.UI.Page
    {
        public string Idioma = "ES";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataSourceComboDivision.SelectCommand = "SELECT [IDDivision], [NDivision] FROM [MDivision] WHERE Idioma='" + Idioma + "' ORDER BY [NDivision]";
                SqlDataSourceComboDelegacion.SelectCommand = string.Empty;
                SqlDataSourceComboClasificacion.SelectCommand = "SELECT [IDClasifAccid],[ClasificacionAccidente] FROM [MAccidClasificacionAccidente] WHERE Idioma='" + Idioma + "' ORDER BY [ClasificacionAccidente]";
                SqlDataSourceComboBO.SelectCommand = "SELECT [BO] FROM [MBO] ORDER BY [BO]";
            }
        }

        protected void ComboDivision_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboDelegacion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboClasificacion_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBO_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
        }

        protected void ComboBoxTipoGrafico_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
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

        protected void BotonLimpiar_Click(object sender, EventArgs e)
        {
            ComboBO.ClearSelection();
            ComboBO.Text = string.Empty;

            ComboDivision.ClearSelection();
            ComboDivision.Text = string.Empty;

            ComboDelegacion.ClearSelection();
            SqlDataSourceComboDelegacion.SelectCommand = string.Empty;
            ComboDelegacion.Text = string.Empty;

            ComboClasificacion.ClearSelection();
            ComboClasificacion.Text = string.Empty;

            TextBoxAnno.Text = string.Empty;

            SqlDataSourceTablaConsultaAccidentes.SelectCommand = string.Empty;
            TablaConsultaAccidentes.Rebind();
            Session["Graficos"] = null;
            RadHtmlChart2.Visible = false;
            TotalEncontrados.Visible = false;
            NumeroTotalEncontrados.Visible = false;
        }

        protected void TablaConsultaAccidentes_ItemDataBound(object sender, GridItemEventArgs e)
        {
            int total = 0; int maximo = 0;
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                List<GraficosData> data = new List<GraficosData>();

                int enero = Convert.ToInt32(item["Enero"].Text);
                maximo = enero > maximo ? enero : maximo;
                total += enero;


                int febrero = Convert.ToInt32(item["Febrero"].Text);
                maximo = febrero > maximo ? febrero : maximo;
                total += febrero;


                int marzo = Convert.ToInt32(item["Marzo"].Text);
                maximo = marzo > maximo ? marzo : maximo;
                total += marzo;


                int abril = Convert.ToInt32(item["Abril"].Text);
                maximo = abril > maximo ? abril : maximo;
                total += abril;


                int mayo = Convert.ToInt32(item["Mayo"].Text);
                maximo = mayo > maximo ? mayo : maximo;
                total += mayo;


                int junio = Convert.ToInt32(item["Junio"].Text);
                maximo = junio > maximo ? junio : maximo;
                total += junio;


                int julio = Convert.ToInt32(item["Julio"].Text);
                maximo = julio > maximo ? julio : maximo;
                total += julio;


                int agosto = Convert.ToInt32(item["Agosto"].Text);
                maximo = agosto > maximo ? agosto : maximo;
                total += agosto;


                int septiembre = Convert.ToInt32(item["Septiembre"].Text);
                maximo = septiembre > maximo ? septiembre : maximo;
                total += septiembre;


                int octubre = Convert.ToInt32(item["Octubre"].Text);
                maximo = octubre > maximo ? octubre : maximo;
                total += octubre;


                int noviembre = Convert.ToInt32(item["Noviembre"].Text);
                maximo = noviembre > maximo ? noviembre : maximo;
                total += noviembre;


                int diciembre = Convert.ToInt32(item["Diciembre"].Text);
                maximo = diciembre > maximo ? diciembre : maximo;
                total += diciembre;


                decimal media = total / 12;
                decimal inferiorMedia = media / 4;
                //public ErrorsDataCS(int valor, string mes, int Total, int Elementos, int Maximo)
                data.Add(new GraficosData(enero, "Enero", total, 12, maximo));

                data.Add(new GraficosData(febrero, "Febrero", total, 12, maximo));
                data.Add(new GraficosData(marzo, "Marzo", total, 12, maximo));
                data.Add(new GraficosData(abril, "Abril", total, 12, maximo));
                data.Add(new GraficosData(mayo, "Mayo", total, 12, maximo));
                data.Add(new GraficosData(junio, "Junio", total, 12, maximo));
                data.Add(new GraficosData(julio, "Julio", total, 12, maximo));
                data.Add(new GraficosData(agosto, "Agosto", total, 12, maximo));
                data.Add(new GraficosData(septiembre, "Septiembre", total, 12, maximo));
                data.Add(new GraficosData(octubre, "Octubre", total, 12, maximo));
                data.Add(new GraficosData(noviembre, "Noviembre", total, 12, maximo));
                data.Add(new GraficosData(diciembre, "Diciembre", total, 12, maximo));

                RadHtmlChart2.DataSource = data;
                RadHtmlChart2.DataBind();
                NumeroTotalEncontrados.Text = total.ToString();

            }
        }


        protected void BotonGraficos_Click(object sender, EventArgs e)
        {

            //B de Buscar
            StringBuilder B = new StringBuilder();
            string[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            int i = 0;
            B.Append("SELECT ");
            foreach (string mes in meses)
            {
                i++;
                B.Append("(SELECT COUNT(Codigo) ");
                B.Append("FROM TAccidentes ");
                B.Append("INNER JOIN MBO ON TAccidentes.BO=MBO.BO ");
                B.Append("INNER JOIN MCentrosOperativos ON MBO.CO=MCentrosOperativos.IDCO ");
                B.Append("INNER JOIN MDelegacion ON MCentrosOperativos.CC=MDelegacion.CC ");
                B.Append("INNER JOIN MAccidClasificacionAccidente ON Clasificacion=MAccidClasificacionAccidente.IDClasifAccid ");
                B.Append("INNER JOIN MDivision ON MDelegacion.Division=MDivision.IDDivision ");

                B.Append("WHERE  MDivision.Idioma='" + Idioma + "' AND MCentrosOperativos.Idioma='" + Idioma + "' AND MDelegacion.Idioma='" + Idioma + "' AND MAccidClasificacionAccidente.Idioma='" + Idioma + "' ");

                if (ComboBO.Text != string.Empty)
                    B.Append("AND TAccidentes.BO='" + ComboBO.Text + "' ");

                if (ComboDivision.SelectedIndex != -1)
                    B.Append("AND IDDivision=" + ComboDivision.SelectedValue + " ");

                if (ComboDelegacion.SelectedIndex != -1)
                    B.Append("AND MDelegacion.CC=" + ComboDelegacion.SelectedValue + " ");

                if (ComboClasificacion.SelectedIndex != -1)
                    B.Append("AND IDClasifAccid=" + ComboClasificacion.SelectedValue + " ");

                if (TextBoxAnno.Text.Length == 4)
                {
                    B.Append("AND FechaAccidente>='" + "01/01/" + TextBoxAnno.Text + "' ");
                    B.Append("AND FechaAccidente<='" + "31/12/" + TextBoxAnno.Text + "' ");
                }

                B.Append("AND MONTH(FechaAccidente)=" + Convert.ToString(i) + " ");
                B.Append(") AS " + mes);
                if (i < 12) B.Append(", ");

            }
            SqlDataSourceTablaConsultaAccidentes.SelectCommand = B.ToString();
            Session["Graficos"] = B.ToString();
            TablaConsultaAccidentes.Rebind();
            RadHtmlChart2.Visible = true;
            TotalEncontrados.Visible = true;
            NumeroTotalEncontrados.Visible = true;

        }


        public class GraficosData
        {
            private int _valor;
            private string _mes;
            private string _color;
            public GraficosData(int valor, string mes, int Total, int Elementos, int Maximo)
            {
                _valor = valor;
                _mes = mes;

                decimal media = Total / Maximo;
                if (_valor == Maximo)
                    _color = "#c81919";
                else
                    if (_valor > media)
                        _color = "#c88519";
                    else
                        if (_valor <= (media / 2))
                            _color = "#28d539";// Verde
                        else

                            _color = "#287dc5";// Azul
            }


            public int Valor
            {
                get { return _valor; }
                set { _valor = value; }
            }

            public string Mes
            {
                get { return _mes; }
                set { _mes = value; }
            }

            public string Color
            {
                get { return _color; }
                set { _color = value; }
            }

        }

    }
}