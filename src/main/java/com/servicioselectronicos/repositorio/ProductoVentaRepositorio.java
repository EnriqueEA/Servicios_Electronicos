package com.servicioselectronicos.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.servicioselectronicos.entidad.ProductoVenta;

public interface ProductoVentaRepositorio extends JpaRepository<ProductoVenta, Integer>{

	@Query("Select x from ProductoVenta x where x.nombre_producto like :var_nombre")
	public abstract List<ProductoVenta> buscaPorNombre(@Param("var_nombre") String filtro);
}
