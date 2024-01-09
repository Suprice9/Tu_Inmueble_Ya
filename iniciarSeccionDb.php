<?php
session_start();

include("conexion.php");

$correo= $_POST["correo"];

$constraseña = $_POST["password"];

$correoElectronico= mysqli_query($conn,"SELECT * FROM usuario WHERE correo_electronico='$correo'");

$query = mysqli_query($conn,"SELECT * FROM usuario WHERE correo_electronico= '$correo' and contrasena= '$constraseña'");

$nr = mysqli_num_rows($query);

if (mysqli_num_rows($correoElectronico)>0){
   $_SESSION['usuario'] =$correo;
   echo '
   <script>
   alert ("Usuario no existe, por favor verifique los datos introducidos");
   window.location="./iniciarsesion.html";
   </script>
';
   exit;
}else{

   echo '
      <script>
      alert ("Usuario no existe, por favor verifique los datos introducidos");
      window.location="./iniciarsesion.html";
      </script>
   '
   ;
   exit;

}


