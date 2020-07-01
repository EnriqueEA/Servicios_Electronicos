<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Servicios Electronicos - Mantenimiento</title>
</head>
<body> 

 <div class="container">
 <h1>Agregar a la Bolsa</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaDetalle_Venta">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="listaDetalle_Venta" class="simple_form" id="defaultForm2"  method="get">
		       		<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">Nombre Producto</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableDetalleVenta" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>idProductoVenta</th>
												<th>unidades</th>
												<th>subtotal</th>
												<th>total</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${DETALLE_VENTAS}" var="x">
													<tr>
														<td>${x.idDetalleVenta}</td>
														<td><a href="/verProducto_Venta">${x.idProductoVenta}</a><--Presione para ver la información</td>
														<td>${x.unidades}</td>
														<td>${x.subtotal}</td>
														<td>${x.total}</td>

														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idDetalleVenta}','${x.idProductoVenta}','${x.unidades}','${x.subtotal}','${x.total}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idDetalleVenta}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
														
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Detalle</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraDetalle_Venta" class="form-horizontal" method="post">
				            <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_idProductoVenta">Id del Producto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_idProductoVenta" name="idProductoVenta" placeholder="Ingrese el Id" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_unidades">Unidades</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_unidades" name="unidades" placeholder="Ingrese numero el Unidades" type="text" maxlength="3"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_subtotal">Subtotal</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_subtotal" name="subtotal" placeholder="Ingrese la Subtotal" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_total">Total</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_total" name="total" placeholder="Ingrese stock" type="text" maxlength="15"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Datos del Detalle</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaDetalle_Venta" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idProductoVenta" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_idProductoVenta">Nombre del Producto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_idProductoVenta" name="idProductoVenta" placeholder="Ingrese el producto" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_unidades">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_unidades" name="unidades" placeholder="Ingrese precio" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_subtotal">Marca</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_subtotal" name="subtotal" placeholder="Ingrese marca" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_total">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_total" name="total" placeholder="Ingrese stock" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){
	$('#idModalRegistra').modal("show");
}

function editar(idProductoVenta,idProductoVenta,unidades,subtotal,total){	
	$('input[id=id_ID]').val(idProductoVenta);
	$('input[id=id_act_idProductoVenta]').val(nombre_producto);
	$('input[id=id_act_unidades]').val(unidades);
	$('input[id=id_act_subtotal]').val(subtotal);
	$('input[id=id_act_total]').val(total);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableProductoVenta').DataTable();
} );
</script>

    
</body>
</html> 