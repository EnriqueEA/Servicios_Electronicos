package com.servicioselectronicos.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.servicioselectronicos.entidad.DetalleVenta;

public interface DetalleVentaRepositorio extends JpaRepository<DetalleVenta, Integer>{

	@Query("select x from DetalleVenta x where x.idProductoVenta like :var_f")
	public abstract List<DetalleVenta> listaDetalleVenta(@Param("var_f") String filtro);
}
