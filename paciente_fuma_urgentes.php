<?php include("conexion/db.php") ?>
<?php include("includes/header.php") ?>
<link rel="stylesheet" href="css/pacientes.css">
<?php include("includes/navegacion.php") ?>

<div>
  <h3>Pacientes Fumadores urgentes prioridad mayor a 4 </h1>
</div>

<div class="card card-body">
 <table class="table table-bordered">
     <thead>
        <tr>
                        <th>Nombres</th>
                        <th>Edad(Años)</th>
                        <th>Nro. Historia</th>
                        <th>Prioridad</th>  
                        <th>Riesgo</th>
                        <th>Tiene dieta</th>
                        <th>Fumador</th>
                        <th>Años de fumador</th>
                        <th>Relacion peso-estatura</th>
                    </tr>
     </thead>
     <tbody>
     <?php 
       //Consultar los pacientes fumadores urgentes
       $query = "SELECT * FROM t_pacientes p WHERE p.fumador = 1 and p.prioridad >4";
       $result = mysqli_query($conn,$query);
       while($row = mysqli_fetch_array($result)){ ?>
       <tr>
                           <td><?php echo $row[1]  ?></td>
                           <td><?php echo $row[2]  ?></td>
                           <td><?php echo $row[3]  ?></td>
                           <td><?php echo $row[4]  ?></td>
                           <td><?php echo $row[5]  ?></td>
                           <td><?php 
                            $dieta = "No";
                            if($row[6] == 1){
                                $dieta = "Si";
                            }
                           echo $dieta; 
                           
                           ?></td>
                           <td><?php 
                             $fumador = "No";
                             if($row[7] == 1){
                                 $fumador = "Si";
                             }
                            echo $fumador; 
                            ?></td>
                           <td><?php echo $row[8]  ?></td>
                           <td><?php echo $row[9]  ?></td>
                       </tr>
                       <?php } ?>
     </tbody>
</table>
</div>



<?php include("includes/footer.php") ?>  