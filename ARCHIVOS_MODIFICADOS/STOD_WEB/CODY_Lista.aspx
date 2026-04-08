<%@ Page Title="" Language="C#" MasterPageFile="~/STODpla.Master" AutoEventWireup="true"
    CodeBehind="CODY_Lista.aspx.cs" Inherits="STOD_Web.CODY_Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        #loaderPantalla {
            display: none; /* Oculto por defecto */
            position: fixed;
            z-index: 99999; /* Para que quede por encima de todo */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Fondo oscuro semitransparente */
        }
        .spinner {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            font-family: Arial, sans-serif;
        }
        .circulo {
            border: 8px solid #f3f3f3; /* Gris claro */
            border-top: 8px solid #3498db; /* Azul */
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: girar 1s linear infinite;
            margin: 0 auto 15px auto;
        }
        @keyframes girar {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>

    <div id="loaderPantalla">
        <div class="spinner">
            <div class="circulo"></div>
            <h3>Cargando registros...</h3>
        </div>
    </div>

    <script type="text/javascript">
        /**** INICIO DE SCRIPTS DEL LOADER ******/
        // 1. Mostrar loader cuando se hace clic en botones normales (Grabar, etc.)
        window.addEventListener("submit", function () {
            document.getElementById("loaderPantalla").style.display = "block";
        });

        // 2. Mostrar loader cuando ASP.NET hace un AutoPostBack (Dropdown o Paginación del GridView)
        window.onload = function () {
            if (typeof window.__doPostBack === 'function') {
                var oldPostBack = window.__doPostBack;
                window.__doPostBack = function (eventTarget, eventArgument) {
                    document.getElementById("loaderPantalla").style.display = "block";
                    oldPostBack(eventTarget, eventArgument);
                };
            }
        };
        /**** FIN DE SCRIPTS DEL LOADER ******/
    </script>
    <div id="divDatos" style="margin: 0 auto 0 auto; width: 780px;" runat="server">
        
        <table width="100%">
            <tr>
                <td align="right" valign="middle">
                    <strong>Mostrar: </strong>
                    <asp:DropDownList ID="ddlPaginacion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPaginacion_SelectedIndexChanged">
                        <asp:ListItem Text="100 registros" Value="100"></asp:ListItem>
                        <asp:ListItem Text="500 registros" Value="500"></asp:ListItem>
                        <asp:ListItem Text="1000 registros" Value="1000"></asp:ListItem>
                        <asp:ListItem Text="Todos" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="imgbtnNuevo" runat="server" ImageUrl="~/images/icons/add.png"
                        OnClick="imgbtnNuevo_Click" ToolTip="Agregar Registros" />&nbsp;
                    <asp:ImageButton ID="imgbtnActualizar" runat="server" ImageUrl="~/images/icons/arrow_refresh.png"
                        ToolTip="Actualizar Registros" OnClick="imgbtnActualizar_Click" />
                </td>
            </tr>
        </table>
        
        <asp:GridView ID="GridViewLista" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
            DataKeyNames="Lista,ItemCode" DataSourceID="ODSLista" PageSize="100" 
            Caption="Lista de Porcentajes de Comisión">
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Lista" HeaderText="Lista" ReadOnly="True" SortExpression="Lista" Visible="False" />
                <asp:BoundField DataField="ItemCode" HeaderText="Codigo" ReadOnly="True" SortExpression="ItemCode">
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ItemName" HeaderText="Nombre" SortExpression="ItemName" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" Visible="False" />
                <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" SortExpression="Porcentaje">
                    <ItemStyle Width="75px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/icons/arrow_out.png"
                    DeleteImageUrl="~/images/icons/cross.png" EditImageUrl="~/images/icons/application_form_edit.png"
                    ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/images/icons/disk.png">
                    <ItemStyle Width="40px" />
                </asp:CommandField>
            </Columns>
            <PagerStyle CssClass="pgr"></PagerStyle>
        </asp:GridView>
        <br />
        <br />
        <br />

        <asp:ObjectDataSource ID="ODSLista" runat="server" DeleteMethod="CODY_EliminarListaDetalle"
            SelectMethod="CODY_ObtenerListaMaestro" TypeName="STOD_Web.CODYWS.CODYWebService"
            UpdateMethod="CODY_ActualizarListaDetalle">
            <DeleteParameters>
                <asp:Parameter Name="Lista" Type="Int32" />
                <asp:Parameter Name="ItemCode" Type="String" />
                <asp:Parameter Name="Precio" Type="Decimal" />
                <asp:Parameter Name="Porcentaje" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Lista" Type="Int32" />
                <asp:Parameter Name="ItemCode" Type="String" />
                <asp:Parameter Name="Precio" Type="Decimal" />
                <asp:Parameter Name="Porcentaje" Type="Decimal" />
                <asp:Parameter Name="Nombre" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
    </div>

    <div id="divNuevo" style="margin: 0 auto 0 auto; width: 780px;" runat="server">
        <table width="780px" class="TablaPlantilla">
            <caption>
                Ingreso de datos de la Lista</caption>
            <thead>
                <tr>
                    <th style="width: 150px;" valign="middle">
                        &nbsp;
                    </th>
                    <th style="width: 630px;" valign="middle" align="center">
                        &nbsp;
                    </th>
                </tr>
            </thead>
            <tr>
                <td style="width: 150px">
                    <strong>Codigo de articulo</strong>
                </td>
                <td style="width: 630px">
                    <asp:TextBox runat="server" Width="100px" ID="txtItemCode"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    <strong>Porcentaje</strong>
                </td>
                <td style="width: 630px">
                    <asp:TextBox runat="server" Width="100px" ID="txtPorcentaje"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:LinkButton ID="LinkGrabar" runat="server" OnClick="LinkGrabar_Click">Grabar</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="linkCancelar" runat="server" OnClick="linkCancelar_Click">Cancelar</asp:LinkButton>
                </td>
            </tr>
            <tfoot>
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top">
                        &nbsp;
                    </td>
                </tr>
            </tfoot>
        </table>
        <br />
    </div>
</asp:Content>