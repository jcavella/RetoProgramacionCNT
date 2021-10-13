<?php include("conexion/db.php") ?>
<?php include("includes/header.php") ?>
<link rel="stylesheet" href="css/pacientes.css">
<?php include("includes/navegacion.php") ?>

<div class="container p-4">
<div>
			<h3>Registrar Paciente </h1>
</div>
    <div class="row">
        <div class="col-md-4">

         <?php if(isset($_SESSION['mensaje'])) { ?>
            <div class="alert alert-<?= $_SESSION['mensaje_tipo'] ?> alert-dismissible fade show" role="alert">
                <?= $_SESSION['mensaje'] ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
         <?php } 
          //Limpiar los datos en sesion
         session_unset();
         
         ?>

            <div class="card card-body">
                <form action="guardar_datos.php" method="POST">
                    <div class="form-group p-1">
                    <label for="nombre" class="form-label">Nombres</label>
                      <input type="text" name="nombre" id="nombre" class ="form-control"
                       placeholder="Nombre paciente" autofocus required>
                    </div>
                    <div class="form-group p-1">
                      <label for="edad" class="form-label">Edad</label>
                       <select class="form-select" name="edad" id="edad" onchange="mostrarDiv()" >
                       <option value ="0" selected>--Edad--</option>
                       <?php  for ($i=1;$i<=110;$i++) {
    echo "<option value='".$i."'>".$i."</option>";
} ?>
                      </select>
                    </div>
                    <div class="form-group p-1">
                     <label for="hclinica" class="form-label">Numero Historia clinica</label>
                      <input type="text" name="hclinica" id="hclinica" class ="form-control"
                       placeholder="Nro. Historia clinica" required>
                    </div>

                    <div id ="ninos" class="d-none" >
                    <label for="relpesoest" class="form-label">Relación peso-estatura</label>
                     <select class="form-select" name="relpesoest" id="relpesoest">
                        <option value ="0" selected>Relación peso estatura</option>
                        <?php  for ($i=1;$i<=4;$i++) {
    echo "<option value='".$i."'>".$i."</option>";
} ?>
                      </select>
                    </div>

                    <div id="joven" class="d-none">
                    <label for="fumador" class="form-label">Es fumador</label>   
                    <select class="form-select" name="fumador" id="fumador">
                        <option value ="0" selected>No</option>
                        <option value ="1" >Si</option>
                      </select>
                      <label for="aniofuma" class="form-label">Años de fumador</label>
                       <select class="form-select" name="aniofuma" id="aniofuma">
                       <option value ="0" selected>Años fumador</option>
                       <?php  for ($i=1;$i<=20;$i++) {
    echo "<option value='".$i."'>".$i."</option>";
} ?>
                      </select>
                      
                    </div>

                    <div id="adulto" class="d-none">
                    <label for="dieta" class="form-label">Tiene dieta</label>   
                    <select class="form-select" name="dieta" id="dieta">
                        <option value ="0" selected>No</option>
                        <option value ="1" >Si</option>
                      </select>
                    </div>

                    
                    <input type="submit" class="btn btn-success btn-block" 
                    name ="save_paciente" value="Guardar">
                </form>
            </div>
        </div>
        <div class="col-md-8">
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
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                       //Consultar los datosdel paciente
                       $query = "SELECT * FROM T_PACIENTES";
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
                           <td>
                               <a href="epaciente.php?id=<?php echo $row[0]?>" class="btn btn-secondary">
                               <i class="fas fa-user-edit"></i></a>
                           </td>
                       </tr>
                       <?php } ?>

                </tbody>
            </table>

        </div>
    </div>

</div>

<script src="js/pacientes.js"></script>
<?php include("includes/footer.php") ?>   

