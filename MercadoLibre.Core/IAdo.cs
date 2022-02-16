using System.Collections.Generic;
using Supermercado.Core;

namespace Mercado.Core
{
    public interface IAdo
    {
        //Acciones para la entidad Rubro
        void AltaCliente(Cliente cliente);
        List<Cliente> ObtenerClientes();

        void AltaProducto(Producto producto);
        List<Producto> ObtenerProductos(); 
    }
}