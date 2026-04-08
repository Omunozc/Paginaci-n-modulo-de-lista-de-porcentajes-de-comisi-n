<%@ Page Title="" Language="C#" MasterPageFile="~/STODpla.Master" AutoEventWireup="true"
    CodeBehind="CODY_Lista.aspx.cs" Inherits="STOD_Web.CODY_Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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