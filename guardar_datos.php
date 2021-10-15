<?php  
include("conexion/db.php");

//Guradar datos del paciente
//========================================================================================
if(isset($_POST['save_paciente'])){
      $nombre = $_POST['nombre'];
      $edad = $_POST['edad'];
      $hclinica = $_POST['hclinica'];
      $relpesoest = $_POST['relpesoest'];
      $fumador = $_POST['fumador'];
      $aniofuma = $_POST['aniofuma'];
      $dieta = $_POST['dieta'];
      $priodidad = 0;
      $riesgo = 0;

      if($relpesoest==""){
         $relpesoest ="0";
      }
      if($aniofuma ==""){
         $aniofuma="0";
      }

      $priodidad =calcularPrioridad($edad,$relpesoest,$fumador,$aniofuma,$dieta);
      $riesgo = calcularRiesgo($edad,$priodidad);

      $query = "INSERT INTO T_PACIENTES(nombre,edad,n_historia_clinica,prioridad,riesgo,tiene_dieta,fumador,annio_fumador,rel_peso_est)
                VALUES('$nombre',$edad,$hclinica,$priodidad, $riesgo,$dieta,$fumador,$aniofuma,$relpesoest)";
      echo $query;
      //echo "peso:".$relpesoest;

      $result= mysqli_query($conn,$query);
      if(!$result){
         die("Error insertar datos");   
      }
      //echo 'Paciente guardado satisfactoriamente';

      $_SESSION['mensaje'] = "Paciente guardado satisfactoriamente";
      $_SESSION['mensaje_tipo'] = 'success';

      //Redireccionar la pagina
      header("Location:index.php");
  }

//========================================================================================


//Definición de funciones 
  //Calcular el riesgo 
  function calcularRiesgo($edad,$priodidad){
     $riesgo =0;
     $riesgo = ($edad*$priodidad)/100;
     if($edad >=41){
      $riesgo = ($edad*$priodidad)/100 + 5.3;
     }
     return $riesgo;
  }

  //Calcular la prioridad
  function calcularPrioridad($edad,$relpesoest,$fumador,$aniofuma,$dieta){
   $priodidad =0;
   //calcular prioridad para niños
   //==============================================
    if($edad >=1 && $edad<=15){
      //Entre 1 a 5 años
      if ($edad >=1 && $edad<=5) {
         $priodidad = $relpesoest + 3;
      }  

      //Entre 6 a 12
      if ($edad >=6 && $edad<=12) {
         $priodidad = $relpesoest + 2;
      } 

       //mayor a 13
       if ($edad >=13) {
         $priodidad = $relpesoest + 1;
      } 
   }
   //==============================================

   //calcular prioridad para jovenes
   //==============================================
   if($edad >=16 && $edad<=40){
      $priodidad =2;
      if($fumador =1){
         $priodidad = ($aniofuma/4) +2;
      }
   }
  //================================================

  //calcular prioridad para Adultos
  //==============================================
  if($edad >=41){
   $priodidad = ($edad/30) + 3;
    if($dieta = 1){
      if($edad >=60 && $edad<=100){
         $priodidad = ($edad/20) + 4;
      }
    }
  }

   return $priodidad;
}

  
?>