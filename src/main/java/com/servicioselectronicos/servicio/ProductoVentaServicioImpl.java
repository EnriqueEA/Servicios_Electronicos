package com.servicioselectronicos.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicioselectronicos.entidad.ProductoVenta;
import com.servicioselectronicos.repositorio.ProductoVentaRepositorio;

@Service
public class ProductoVentaServicioImpl implements ProductoVentaServicio {

	@Autowired
	private ProductoVentaRepositorio repositorio;
	
	@Override
	public void eliminaProductoVenta(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public ProductoVenta insertaActualizaProductoVenta(ProductoVenta p) {
		return repositorio.save(p);
	}

	@Override
	public List<ProductoVenta> listaProductoVenta() {
		return repositorio.findAll();
	}

	@Override
	public List<ProductoVenta> listaProductoVentaPorNombre(String filtro) {
		return repositorio.buscaPorNombre(filtro);
	}

}
