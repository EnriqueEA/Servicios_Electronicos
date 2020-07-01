package com.servicioselectronicos.servicio;

import java.util.List;

import com.servicioselectronicos.entidad.DetalleVenta;

public interface DetalleVentaServicio {

	public abstract void eliminaDetalleVenta(int id);
	public abstract DetalleVenta insertaActualizaDetalleVenta(DetalleVenta dv);
	public abstract List<DetalleVenta> listaDetalleVenta();
	public List<DetalleVenta> listaDetalleVentaPorNombre(String filtro);
}
