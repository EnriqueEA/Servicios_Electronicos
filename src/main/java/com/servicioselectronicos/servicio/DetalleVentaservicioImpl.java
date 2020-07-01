package com.servicioselectronicos.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicioselectronicos.entidad.DetalleVenta;
import com.servicioselectronicos.repositorio.DetalleVentaRepositorio;

@Service
public class DetalleVentaservicioImpl implements DetalleVentaServicio {

	@Autowired
	private DetalleVentaRepositorio repo;
	
	@Override
	public void eliminaDetalleVenta(int id) {
		repo.deleteById(id);

	}

	@Override
	public DetalleVenta insertaActualizaDetalleVenta(DetalleVenta dv) {
		return repo.save(dv);
	}

	@Override
	public List<DetalleVenta> listaDetalleVenta() {
		return repo.findAll();
	}

	@Override
	public List<DetalleVenta> listaDetalleVentaPorNombre(String filtro) {
		return repo.listaDetalleVenta(filtro);
	}

}
