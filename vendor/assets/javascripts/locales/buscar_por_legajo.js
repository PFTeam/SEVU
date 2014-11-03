function buscarPorLegajo(){
   $("#boton_buscar").click(function(){
     var legajo = $("#legajo").val();
     $.ajax({
        url: "/empleados/buscar_por_legajo/" + legajo,
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
              $("#respuesta").html('<a href="/empleados/'+res.id+'"> '+res.nombreUsuario+' ' + res.apellido_nombre + ' </a>');
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
