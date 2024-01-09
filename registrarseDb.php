<?php
include ("Conexion.php");

$nombre= $_POST["nombre"];

$apellido= $_POST["apellido"];

$cedula= $_POST["cedula"];

$correo = $_POST["correo"];

$contrasena = $_POST["contrasena"];

if (isset($_POST['submit'])){
    if (empty($_POST['nombre'])){
        echo "Por favor ingresar nombre";
    }


}

$insert = "INSERT INTO usuario (nombre,apellido,cedula,correo_electronico,contrasena) VALUES ('$nombre','$apellido','$cedula','$correo','$contrasena');";
$ejecutar=mysqli_query($conn,$insert);

if ($ejecutar>0)
{
    echo '
        <script>
        alert ("Usuario almacenado exitosamente");
        window.location = "./index.html";
        </script>
        ';


}else
    echo'
    <script>
    alert ("Usuario no almacenado");
    window.location = "./index.html";
    </script>
    ';
    
    



?>