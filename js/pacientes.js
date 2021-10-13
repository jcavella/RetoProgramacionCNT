
//Establecer el valor de años para mostrar los div
function mostrarDiv()
{

    let select=document.getElementById("edad");
    let valor = select.value;

    //Obtener los div e idenrificar cual se debe mostrar
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
