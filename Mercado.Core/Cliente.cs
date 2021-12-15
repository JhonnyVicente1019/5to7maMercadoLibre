using System.Collections.Generic;

namespace Mercado.core
{
    public class Cliente
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int telefono { get; set; }
        public string email { get; set; }
        public string nUsuario { get; set; }
        public char contraseña { get; set; }
        public Cliente () {List<Compra> compras = new List<Compra>();}
    }
}