using et12.edu.ar.AGBD.Mapeadores;
using et12.edu.ar.AGBD.Ado;
using System;
using System.Data;
using System.Collections.Generic;

namespace MercadoLibre.AdoMySQL.Mapeadores
{
    public class MapProducto: Mapeador<Producto>
    {
        public MapProducto(AdoAGBD ado):base(ado)
        {
            Tabla = "Producto";
        }
        public override Producto ObjetoDesdeFila(DataRow fila)
            => new Producto()
            {
                Id = Convert.ToByte(fila["idProducto"]),
                Nombre = fila["producto"].ToString()
            };

        public void AltaProducto(Producto producto)
            => EjecutarComandoCon("altaProducto", ConfigurarAltaProducto, PostAltaProducto, producto);

        public void ConfigurarAltaProducto(Producto producto)
        {
            SetComandoSP("altaProducto");

            BP.CrearParametroSalida("unIdProducto")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.UByte)
              .AgregarParametro();

            BP.CrearParametro("unProducto")
              .SetTipoVarchar(45)
              .SetValor(producto.Nombre)
              .AgregarParametro();
        }

        public void PostAltaProducto(Producto producto)
        {
            var paramIdProducto = GetParametro("unIdProducto");
            producto.Id = Convert.ToByte(paramIdProducto.Value);
        }

        public Producto ProductoPorId(byte id)
        {
            SetComandoSP("ProductoPorId");

            BP.CrearParametro("unIdProducto")
              .SetTipo(MySql.Data.MySqlClient.MySqlDbType.Byte)
              .SetValor(id)
              .AgregarParametro();

            return ElementoDesdeSP();
        }

        public List<Producto> ObtenerProductos() => ColeccionDesdeTabla();
    }
}