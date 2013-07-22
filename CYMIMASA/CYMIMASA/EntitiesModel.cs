﻿#pragma warning disable 1591
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
using CYMIMASA;


namespace CYMIMASA	
{
	public partial class BBDD : OpenAccessContext, IBBDDUnitOfWork
	{
		private static string connectionStringName = @"BBDDConexion";
			
		private static BackendConfiguration backend = GetBackendConfiguration();
		
			
		private static MetadataSource metadataSource = XmlMetadataSource.FromAssemblyResource("EntitiesModel.rlinq");
	
		public BBDD()
			:base(connectionStringName, backend, metadataSource)
		{ }
		
		public BBDD(string connection)
			:base(connection, backend, metadataSource)
		{ }
	
		public BBDD(BackendConfiguration backendConfiguration)
			:base(connectionStringName, backendConfiguration, metadataSource)
		{ }
			
		public BBDD(string connection, MetadataSource metadataSource)
			:base(connection, backend, metadataSource)
		{ }
		
		public BBDD(string connection, BackendConfiguration backendConfiguration, MetadataSource metadataSource)
			:base(connection, backendConfiguration, metadataSource)
		{ }
			
		public IQueryable<MaestraPaises> MaestraPaises1 
		{
	    	get
	    	{
	        	return this.GetAll<MaestraPaises>();
	    	}
		}
		
		public static BackendConfiguration GetBackendConfiguration()
		{
			BackendConfiguration backend = new BackendConfiguration();
			backend.Backend = "MsSql";
			backend.ProviderName = "System.Data.SqlClient";
			backend.Logging.MetricStoreSnapshotInterval = 0;
			return backend;
		}
	}

	public interface IBBDDUnitOfWork : IUnitOfWork
	{
		IQueryable<MaestraPaises> MaestraPaises1 
		{ 
			get;
		}

	}
}
#pragma warning restore 1591

