//Validar registro de datos
(function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
           let okV = true;
           let edad = document.getElementById("edad").value;
           let relpesoest =document.getElementById("relpesoest");
           let fumador = document.getElementById("fumador").value;
           let aniofuma = document.getElementById("aniofuma");

           //Validar la seleccion de peso y estatura
           if(edad >=1 && edad <=15 ){
             if(relpesoest.value ==0 ){
                alert("Por favor seleccione la relación peso - estatura");
                relpesoest.focus();
                event.preventDefault();
                event.stopPropagation();
             }
           }  

           //Validar los años de fumador
           if(edad >=16 && edad <=40 ){
            if(fumador == 1 ){
                if(aniofuma.value == 0){
                 alert("Por favor seleccione los años de fumador");
                 aniofuma.focus();
                  event.preventDefault();
                 event.stopPropagation();
                }
            }
          }  

          //event.preventDefault();

          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();



//Establecer el valor de años para mostrar los div
//========================================================
function mostrarDiv()
{

    let select=document.getElementById("edad");
    let valor = select.value;

    //Obtener los div e identificar cual se debe mostrar
    let dnino = document.getElementById("ninos");
    let djoven = document.getElementById("joven");
    let dadulto = document.getElementById("adulto");

    //Ocultar todos los div
    dnino.className = "d-none";
    djoven.className = "d-none";
    dadulto.className = "d-none";

   //Paciente niño
    if(valor >=1 && valor <=15 ){
        dnino.className = "d-block";
    }

   //Paciente joven
   if(valor >=16 && valor <=40 ){
    djoven.className = "d-block";
   }

   //Paciente Adulto
   if(valor >=41 ){
    dadulto.className = "d-block";
   }
}
//========================================================