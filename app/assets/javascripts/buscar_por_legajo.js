function buscarPorLegajo(){
   $("#boton_buscar").click(function(){
     var legajo = $("#legajo").val();
     $.ajax({
        url: "buscar_por_legajo/" + legajo,
        dataType: "JSON",
        timeout: 10000,
        beforeSend: function(){
           $("#respuesta").html("Cargando...");
        },
        error: function(){
           $("#respuesta").html("Error al intentar buscar el empleado. Por favor intente más tarde.");
        },
        success: function(res){ 
          if(res){

          
/*$("#respuesta").html('<a href="/adminitrar_estado_usuario/new?estado_usuario_id='+res.id+'& " > '
+res.nombreUsuario+' ' + res.apellido_nombre +''+ res + ' </a>');*/
/*$("#respuesta").html('<h1>se encontro el usuario '+res.id+'  </h1>');*/
         
$("#respuesta").html(
	'<h1>se encontro el usuario '+res.id+' nombre:'  + res.nombreUsuario  + 'apellido:  '+ res.apellido_nombre +'  </h1>'+
	'<INPUT type="hidden" name="usuario_id" value="'+res.id+'">'+
	'<table width="200" border="3">'+
 ' <tr>  <th scope="col">nombre</th> <th scope="col">apellido</th> <th scope="col">id</th>  <th scope="col">otro</th>  </tr>'+
 ' <tr> <td>'+ res.nombreUsuario  +'</td> <td>'+ res.apellido_nombre +'</td>  <td>'+res.id+'</td>  <td>&nbsp;</td> </tr> '+
'</table>'
	
 );

  }else{
              $("#respuesta").html("El legajo no le pertenece a ningún empleado.");
           }
        }
     })
  });
};
$(document).ready(function(){
   buscarPorLegajo();
});
