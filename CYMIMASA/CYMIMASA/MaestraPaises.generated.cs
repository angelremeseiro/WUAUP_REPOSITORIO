#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Common;
using System.Collections.Generic;
using Telerik.OpenAccess;
using Telerik.OpenAccess.Metadata;
using Telerik.OpenAccess.Data.Common;
using Telerik.OpenAccess.Metadata.Fluent;
using Telerik.OpenAccess.Metadata.Fluent.Advanced;


namespace CYMIMASA	
{
	public partial class MaestraPaises
	{
		private int _iDPais;
		public virtual int IDPais 
		{ 
		    get
		    {
		        return this._iDPais;
		    }
		    set
		    {
		        this._iDPais = value;
		    }
		}
		
		private string _nombrePais;
		public virtual string NombrePais 
		{ 
		    get
		    {
		        return this._nombrePais;
		    }
		    set
		    {
		        this._nombrePais = value;
		    }
		}
		
	}
}
