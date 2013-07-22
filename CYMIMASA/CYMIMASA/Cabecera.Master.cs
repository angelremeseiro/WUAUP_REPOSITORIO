#region Usings
// General
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Telerik
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

// Mio
using CYMIMASA;
using System.Threading;
using System.Security.Principal;

#endregion


namespace CYMIMASA
{
    public partial class Cabecera : System.Web.UI.MasterPage
    {
        public Sesion sesion;
        public Global global;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string valor = Page.Request.QueryString["Codigo"];
                if (valor != null && valor != string.Empty)
                { // Se ejecuta sólo la primera vez que se accede a la página y se cargan datos.
                    CabeceraMaster.Visible = false;
                }
            }
            // Comprobamos si el aplicativo ya ha arrancado previamente
            if (Application["CYMIMASA"] == null)
            {
                // No  ha arrancado, debemos inicializar el aplicativo
                global = new Global();
                Application["CYMIMASA"] = global;
            }
            else
            {
                global = (Global)Application["CYMIMASA"];
            }

            // Comprobamos si el usuario se encuentra en RAM en el servidor por haber arrancado previamente.
            if (Session["Usuario"] == null)
            {
                // No  ha arrancado, debemos crearlo con el nombre de usuario logeado

                //string usuario = WindowsIdentity.GetCurrent().Name;



                string usuario = Environment.UserName;


                //string usuario = Thread.CurrentPrincipal.Identity.Name;
                sesion = new Sesion(usuario);


                if (!Page.IsPostBack)
                {
                    PersonaLogeada.Items.Add(new ListItem(usuario, "Usuario", true));
                    PersonaLogeada.Items.Add(new ListItem("Ajustes del Usuario", "Ajustes", true));
                    PersonaLogeada.Items.Add(new ListItem("Cambiar de Usuario", "CambioUsuario", true));
                    PersonaLogeada.Items.Add(new ListItem("Castellano", "ES", true));
                    PersonaLogeada.Items.Add(new ListItem("English", "EN", true));

                }

                Session["Usuario"] = sesion;
            }
            else
            {
                sesion = (Sesion)Session["Usuario"];
            }


        }

        protected void PersonaLogeada_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PersonaLogeada.SelectedValue == "EN")
            {
                sesion.Idioma = "EN";
                sesion.CambioIdioma = true;
            }
            else
            {
                sesion.Idioma = "ES";
                sesion.CambioIdioma = true;
            }

        }
    }
}