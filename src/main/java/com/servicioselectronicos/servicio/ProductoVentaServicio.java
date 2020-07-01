package com.servicioselectronicos.servicio;

import java.util.List;

import com.servicioselectronicos.entidad.ProductoVenta;

public interface ProductoVentaServicio {

	public abstract void eliminaProductoVenta(int id);
	public abstract ProductoVenta insertaActualizaProductoVenta(ProductoVenta pv);
	public abstract List<ProductoVenta> listaProductoVenta();
	public List<ProductoVenta> listaProductoVentaPorNombre(String filtro);
}
