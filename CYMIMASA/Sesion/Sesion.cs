using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CYMIMASA
{
    public class Sesion
    {
        public string Idioma;
        public bool CambioIdioma;
        private string nombreUsuarioLogeado;
        public string NombreUsuarioLogeado
        {
            get { return nombreUsuarioLogeado; }
            set { nombreUsuarioLogeado = value; }
        }

        public Sesion(string NombreUsuarioLogeado)
        {
            nombreUsuarioLogeado = NombreUsuarioLogeado;


        }
    }
}
