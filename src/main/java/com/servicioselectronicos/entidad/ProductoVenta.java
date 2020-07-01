package com.servicioselectronicos.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "producto_venta")
public class ProductoVenta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idProductoVenta")
	private int idProductoVenta;
	
	@Column(name = "nombre_producto")
	private String nombre_producto;
	
	@Column(name = "precio")
	private double precio_producto;
	
	@Column(name = "marca")
	private String marca_producto;
	
	@Column(name = "stock")
	private int stock_producto;

	public int getIdProductoVenta() {
		return idProductoVenta;
	}

	public void setIdProductoVenta(int idProductoVenta) {
		this.idProductoVenta = idProductoVenta;
	}

	public String getNombre_producto() {
		return nombre_producto;
	}

	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}

	public double getPrecio_producto() {
		return precio_producto;
	}

	public void setPrecio_producto(double precio_producto) {
		this.precio_producto = precio_producto;
	}

	public String getMarca_producto() {
		return marca_producto;
	}

	public void setMarca_producto(String marca_producto) {
		this.marca_producto = marca_producto;
	}

	public int getStock_producto() {
		return stock_producto;
	}

	public void setStock_producto(int stock_producto) {
		this.stock_producto = stock_producto;
	}
	
	
}
