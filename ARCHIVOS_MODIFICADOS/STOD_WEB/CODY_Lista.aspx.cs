using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Reportes;
using System.IO;
using STOD_Web.BLL;
using STOD_Web.CODYWS;

namespace STOD_Web
{
    public partial class CODY_Lista : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.QueryString["BlankForAngular"] != null)
            {
                this.MasterPageFile = "BlankForAngular.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (this.Session["LoggedInRole"] == null)
                    this.Response.Redirect(Config.URLDefault);
                string MenuURL = Path.GetFileName(Request.PhysicalPath);
                bool HasAccess = dsAdmin.RoleHasAccessToPage(this.Session["LoggedInRole"].ToString(), MenuURL);
                if (!HasAccess)
                {
                    Response.Redirect(Config.URLDefault);
                }
            }
            this.divNuevo.Visible = false;
        }

        protected void LinkGrabar_Click(object sender, EventArgs e)
        {
            divDatos.Visible = true;
            divNuevo.Visible = false;
            string MensajeSTOD = "";

            CODYWebService ws = new CODYWebService();
            try
            {
                MensajeSTOD = ws.CODY_InsertarListaDetalle(0, txtItemCode.Text, 0, Convert.ToDecimal(txtPorcentaje.Text));

                GridViewLista.DataBind();

                txtItemCode.Text = "";
                txtPorcentaje.Text = "";
                if (Request.QueryString["BlankForAngular"] != null)
                {
                    ((BlankForAngular)this.Master).PonerMensaje(MensajeSTOD, "");
                }
                else
                {
                    ((STODpla)this.Master).PonerMensaje(MensajeSTOD, "");
                }
            }
            catch
            {
                if (Request.QueryString["BlankForAngular"] != null)
                {
                    ((BlankForAngular)this.Master).PonerMensaje("ERROR: no se puede grabar el registro...!!!", "");
                }
                else
                {
                    ((STODpla)this.Master).PonerMensaje("ERROR: no se puede grabar el registro...!!!", "");
                }
            }
        }

        protected void linkCancelar_Click(object sender, EventArgs e)
        {
            divDatos.Visible = true;
            divNuevo.Visible = false;
        }

        protected void imgbtnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            divDatos.Visible = false;
            divNuevo.Visible = true;
        }

        protected void imgbtnActualizar_Click(object sender, ImageClickEventArgs e)
        {
            GridViewLista.DataBind();
        }

        // === INICIO DE CAMBIOS: MÉTODOS PARA PAGINACIÓN Y BÚSQUEDA DINÁMICA ===

        protected void ddlPaginacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPaginacion.SelectedValue);

            if (pageSize == 0) // El valor "0" representa "Todos"
            {
                GridViewLista.AllowPaging = false; // Apaga la paginación para mostrar todos
            }
            else
            {
                GridViewLista.AllowPaging = true;
                GridViewLista.PageSize = pageSize; // Aplica el tamaño seleccionado
            }

            // Regresamos a la primera página por seguridad
            if (GridViewLista.AllowPaging)
            {
                GridViewLista.PageIndex = 0;
            }

            GridViewLista.DataBind();
        }


        // === FIN DE CAMBIOS ===
    }
}