using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CYMIMASA.paginas.accidentes
{
    public partial class accidentes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string valor = Page.Request.QueryString["Codigo"];
                if (valor != null && valor != string.Empty)
                { // Se ejecuta sólo la primera vez que se accede a la página y se cargan datos.
                    VisibleLateral.Visible = false;
                }
            }
        }
    }
}