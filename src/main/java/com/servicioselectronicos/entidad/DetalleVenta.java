package com.servicioselectronicos.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "detalle_venta")
public class DetalleVenta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idDetalleVenta")
	private int idDetalleVenta;
	
	
	@Column(name = "idProductoVenta")
	private int idProductoVenta;
	
	@Column(name = "unidades")
	private int unidades;
	
	@Column(name = "subtotal")
	private double subtotal;
	
	@Column(name = "total")
	private double total;

	public int getIdDetalleVenta() {
		return idDetalleVenta;
	}

	public void setIdDetalleVenta(int idDetalleVenta) {
		this.idDetalleVenta = idDetalleVenta;
	}

	public int getIdProductoVenta() {
		return idProductoVenta;
	}

	public void setIdProductoVenta(int idProductoVenta) {
		this.idProductoVenta = idProductoVenta;
	}

	public int getUnidades() {
		return unidades;
	}

	public void setUnidades(int unidades) {
		this.unidades = unidades;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	

}
