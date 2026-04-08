using STOD_BLL.dsCODYTableAdapters;
using System.Data.SqlClient;
using System.Configuration;
using System;

namespace STOD_BLL {
    
    
    public partial class dsCODY {

        public dtCODY_ListaMaestroDataTable CODY_ObtenerListaMaestro()
        {
            dtCODY_ListaMaestroDataTable dt = new dtCODY_ListaMaestroDataTable();
            dtCODY_ListaMaestroTableAdapter ta = new dtCODY_ListaMaestroTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public void CODY_ActualizarListaDetalle(int Lista, string ItemCode, decimal Precio, decimal Porcentaje, string Nombre)
        {
            dtCODY_ListaMaestroTableAdapter ta = new dtCODY_ListaMaestroTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.CODY_ActualizarListaDetalle(Lista, ItemCode, Precio, Porcentaje, Nombre);
        }

        public void CODY_EliminarListaDetalle(int Lista, string ItemCode, decimal Precio, decimal Porcentaje)
        {
            dtCODY_ListaMaestroTableAdapter ta = new dtCODY_ListaMaestroTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.CODY_EliminarListaDetalle(Lista, ItemCode, Precio, Porcentaje);
        }

        public string CODY_InsertarListaDetalle(int Lista, string ItemCode, decimal Precio, decimal Porcentaje)
        {
            dtCODY_ListaMaestroTableAdapter ta = new dtCODY_ListaMaestroTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            return ta.CODY_InsertarListaDetalle(Lista, ItemCode, Precio, Porcentaje).ToString();
        }

        public dtCODY_ComisionesDataTable CODY_ObtenerComisiones()
        {
            dtCODY_ComisionesDataTable dt = new dtCODY_ComisionesDataTable();
            dtCODY_ComisionesTableAdapter ta = new dtCODY_ComisionesTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public void CODY_GenerarComsiones(DateTime FDesde, DateTime FHasta)
        {
            dtCODY_ComisionesTableAdapter ta = new dtCODY_ComisionesTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.CODY_GenerarComisiones (FDesde, FHasta);
        }

        public dtCODY_ParametrosDataTable CODY_ObtenerParametros()
        {
            dtCODY_ParametrosDataTable dt = new dtCODY_ParametrosDataTable();
            dtCODY_ParametrosTableAdapter ta = new dtCODY_ParametrosTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public void CODY_ActualizarParametros(int CodigoDistribuidores, int CodigoListaPrecios, string CodigoDivision, string CodigoCategoria, DateTime FechaInicio)
        {
            dtCODY_ParametrosTableAdapter ta = new dtCODY_ParametrosTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.CODY_ActualizarParametros(CodigoDistribuidores, CodigoListaPrecios, CodigoDivision, CodigoCategoria, FechaInicio);
        }

        public dtCODY_FacturasDataTable CODY_ObtenerFacturas(string Factura, string Serie)
        {
            dtCODY_FacturasDataTable dt = new dtCODY_FacturasDataTable();
            dtCODY_FacturasTableAdapter ta = new dtCODY_FacturasTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt,Factura, Serie);

            return dt;
        }

        public dtCODY_PeriodoDataTable CODY_ObtenerPeriodo()
        {
            dtCODY_PeriodoDataTable dt = new dtCODY_PeriodoDataTable();
            dtCODY_PeriodoTableAdapter ta = new dtCODY_PeriodoTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            ta.Fill(dt);
            return dt;
        }

        public string CODY_CerrarComisiones(string Codigo, string Usuario)
        {
            dtCODY_PeriodoTableAdapter ta = new dtCODY_PeriodoTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            return ta.CODY_CerrarComisiones(Codigo, Usuario).ToString();
        }

        public string CODY_ActualizarFacturaPorcentaje(string Factura, string Serie, decimal Porcentaje, string Nota, string Usuario)
        {
            dtCODY_FacturasTableAdapter ta = new dtCODY_FacturasTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            return ta.CODY_ActualizarFacturaPorcentaje(Factura, Serie, Porcentaje, Nota, Usuario).ToString();
        }

        public string CODY_OmitirPagoFactura(string Factura, string Serie, string Nota, string Usuario)
        {
            dtCODY_FacturasTableAdapter ta = new dtCODY_FacturasTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            return ta.CODY_OmitirPagoFactura(Factura, Serie, Nota, Usuario).ToString();
        }

        public string CODY_ActivarPagoFactura(string Factura, string Serie, string Usuario, string Nota)
        {
            dtCODY_FacturasTableAdapter ta = new dtCODY_FacturasTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            return ta.CODY_ActivarPagoFactura(Factura, Serie, Usuario, Nota).ToString();
        }

        public dtCODY_DivisionesDataTable CODY_ObtenerDivisiones()
        {
            dtCODY_DivisionesDataTable dt = new dtCODY_DivisionesDataTable();
            dtCODY_DivisionesTableAdapter ta = new dtCODY_DivisionesTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public dtCODY_CategoriasDataTable CODY_ObtenerCategorias()
        {
            dtCODY_CategoriasDataTable dt = new dtCODY_CategoriasDataTable();
            dtCODY_CategoriasTableAdapter ta = new dtCODY_CategoriasTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public dtCODY_ComisionesResumenDataTable CODY_ObtenerComisionesResumen()
        {
            dtCODY_ComisionesResumenDataTable dt = new dtCODY_ComisionesResumenDataTable();
            dtCODY_ComisionesResumenTableAdapter ta = new dtCODY_ComisionesResumenTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt);

            return dt;
        }

        public dtCODY_ComisionesPorFechaCierreDataTable CODY_ObtenerComisionesPorFechaCierre(DateTime CierreFecha)
        {
            dtCODY_ComisionesPorFechaCierreDataTable dt = new dtCODY_ComisionesPorFechaCierreDataTable();
            dtCODY_ComisionesPorFechaCierreTableAdapter ta = new dtCODY_ComisionesPorFechaCierreTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            ta.Fill(dt, CierreFecha);
            return dt;
        }

        public dtCODY_ComisionesPorCorrelativoDataTable CODY_ObtenerComisionesPorCorrelativo(int Correlativo)
        {
            dtCODY_ComisionesPorCorrelativoDataTable dt = new dtCODY_ComisionesPorCorrelativoDataTable();
            dtCODY_ComisionesPorCorrelativoTableAdapter ta = new dtCODY_ComisionesPorCorrelativoTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);

            ta.Fill(dt, Correlativo);

            return dt;
        }

        public string CODY_ActualizarFacturaPrecioLista(string Factura, string Serie, decimal PrecioLista, string Nota, string Usuario)
        {
            dtCODY_FacturasTableAdapter ta = new dtCODY_FacturasTableAdapter();
            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            return ta.CODY_ActualizarFacturaPrecioLista(Factura, Serie, PrecioLista, Nota, Usuario).ToString();
        }

        public dtCODY_FechaInicialDataTable CODY_ObtenerFechaInicial()
        {
            dtCODY_FechaInicialDataTable dt = new dtCODY_FechaInicialDataTable();
            dtCODY_FechaInicialTableAdapter ta = new dtCODY_FechaInicialTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            ta.Fill(dt);
            return dt;
        }

        public dtCODY_DistribuidoresDataTable CODY_ObtenerDistribuidores()
        {
            dtCODY_DistribuidoresDataTable dt = new dtCODY_DistribuidoresDataTable();
            dtCODY_DistribuidoresTableAdapter ta = new dtCODY_DistribuidoresTableAdapter();

            ta.Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ServidorCanellaService"].ConnectionString);
            ta.Fill(dt);
            return dt;
        }
        
    }
}


