package com.servicioselectronicos.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicioselectronicos.entidad.DetalleVenta;
import com.servicioselectronicos.servicio.DetalleVentaServicio;

@Controller
public class DetalleVentaControlador {

	@Autowired
	private DetalleVentaServicio servicio;
	
	@RequestMapping("")
	public String redireccionar(Model m) {
		List<DetalleVenta> list = servicio.listaDetalleVenta();
		m.addAttribute("DETALLE_VENTAS", list);
		return "detalle_ventas";
	}
	
	@RequestMapping("verDetalle_Venta")
	public String mostrarDetalle(Model m) {
		List<DetalleVenta> list = servicio.listaDetalleVenta();
		m.addAttribute("DETALLE_VENTAS", list);
		return "detalle_ventas";
	}
	
	@RequestMapping("/listaDetalle_Venta")
	public String listarDetalleVenta(@RequestParam Map<String, String> p, Model m) {
		m.addAttribute("DETALLE_VENTAS", servicio.listaDetalleVentaPorNombre(p.get("filtro")));
		return "detalle_ventas";
	}
	
	@RequestMapping("/registraDetalle_Venta")
	public String registraDetalleVenta(DetalleVenta p, Model m) {
		servicio.insertaActualizaDetalleVenta(p);
		m.addAttribute("DETALLE_VENTAS", servicio.listaDetalleVenta());
		return "detalle_ventas";
	}
	
	@RequestMapping("/actualizaDetalle_Venta")
	public String actualizarDetalleVenta(DetalleVenta p, Model m) {
		servicio.insertaActualizaDetalleVenta(p);
		m.addAttribute("DETALLE_VENTAS", servicio.listaDetalleVenta());
		return "detalle_ventas";
	}
	
	@RequestMapping("/eliminaDetalle_Venta")
	public String eliminarDetalleVenta(@RequestParam Map<String, String> p, Model m) {
		servicio.eliminaDetalleVenta(Integer.parseInt(p.get("id")));
		m.addAttribute("DETALLE_VENTAS", servicio.listaDetalleVenta());
		return "detalle_ventas";
	}
}
