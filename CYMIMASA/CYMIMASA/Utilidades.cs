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

namespace CYMIMASA
{
    public static class Utilidades
    {
        public static string CheckedItemsToString(RadComboBox Combo)
        {
            if (Combo.CheckedItems.Count == 0)
                return string.Empty;
            else
            {
                var incognito = Combo.CheckedItems;
                var str = new StringBuilder();
                foreach (RadComboBoxItem item in incognito)
                    str.Append(item.Value + ";");
                return str.ToString();
            }
        }

        public static void StringToItemsChecked(string Str, RadComboBox Combo)
        {
            Combo.DataBind();
            List<string> names = new List<string>(Str.Split(';'));
            foreach (string item in names)
            {
                if (item != string.Empty)
                {
                    (Combo.FindItemByValue(item)).Checked = true;

                }
               
            }
        }


        public static int CalculoAnnos(DateTime FechaPrimera, DateTime FechaSegunda)
        {
            TimeSpan ts = FechaSegunda - FechaPrimera;
            DateTime d = DateTime.MinValue + ts;
            //int dias = d.Day - 1;
            //int meses = d.Month - 1;
            int annos = d.Year - 1;
            return annos;
        }


    }
}