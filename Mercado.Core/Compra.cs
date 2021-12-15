using System;

namespace Mercado.core
{
    public class Compra
    {
        public int idProducto { get; set; }
        public int idCliente { get; set; }
        public DateTime fechaHora { get; set; }
        public int cUnidades { get; set; }
        public double precioDeCompra { get; set; }
    }
}