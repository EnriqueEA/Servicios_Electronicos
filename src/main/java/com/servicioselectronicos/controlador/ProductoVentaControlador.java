package com.servicioselectronicos.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicioselectronicos.entidad.ProductoVenta;
import com.servicioselectronicos.servicio.ProductoVentaServicio;

@Controller
public class ProductoVentaControlador {

	@Autowired
	private ProductoVentaServicio servicio;
	
	@RequestMapping("verProducto_Venta")
	public String mostrarProducto(Model m) {
		List<ProductoVenta> list = servicio.listaProductoVenta();
		m.addAttribute("PRODUCTO_VENTAS", list);
		return "producto_ventas";
	}
	
	@RequestMapping("/listaProducto_Venta")
	public String listarProdutoVenta(@RequestParam Map<String, String> p, Model m) {
		m.addAttribute("PRODUCTO_VENTAS", servicio.listaProductoVentaPorNombre(p.get("filtro")));
		return "producto_ventas";
	}
	
	@RequestMapping("/registraProducto_Venta")
	public String registraProductoVenta(ProductoVenta p, Model m) {
		servicio.insertaActualizaProductoVenta(p);
		m.addAttribute("PRODUCTO_VENTAS", servicio.listaProductoVenta());
		return "producto_ventas";
	}
	
	@RequestMapping("/actualizaProducto_Venta")
	public String actualizarProductoVenta(ProductoVenta p, Model m) {
		servicio.insertaActualizaProductoVenta(p);
		m.addAttribute("PRODUCTO_VENTAS", servicio.listaProductoVenta());
		return "producto_ventas";
	}
	
	@RequestMapping("/eliminaProducto_Venta")
	public String eliminarProductoVenta(@RequestParam Map<String, String> p, Model m) {
		servicio.eliminaProductoVenta(Integer.parseInt(p.get("id")));
		m.addAttribute("PRODUCTO_VENTAS", servicio.listaProductoVenta());
		return "producto_ventas";
	}
}
