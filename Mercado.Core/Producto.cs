using System;
namespace Mercado.core
{
    public class Producto
    {
        public double precio { get; set; }
        public int cantidad { get; set; }
        public string nombre { get; set; }
        public DateTime fecha { get; set; }
        public int idProducto { get; set; }
        public int idCliente { get; set; } 
    }
}