<?php
use PHPMailer\PHPMailer\PHPMailer;

use PHPMailer\PHPMailer\Exception;
    
require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

$correo= $_POST["email"];

$asunto = $_POST["asunto"];

$mensaje = $_POST["mensaje"];

$enviar = $_POST["enviar"];

if (isset($enviar)){
    $mail=new PHPMailer(true);

    $mail->isSMTP();
    $mail->Host='smtp.gmail.com';
    $mail->SMTPAuth= true;
    $mail->Username='wilmirafael123@gmail.com';
    $mail->Password ='xvaqebikqhcbsfkx';
    $mail->SMTPSecure = 'ssl';
    $mail->Port =465;

    $mail->setFrom('wilmirafael123@gmail.com');

    $mail->addAddress($correo);

    $mail->isHTML(true);

    $mail->Subject=$asunto;
    
    $mail->Body=$mensaje;

    $mail->send();
    echo '
    <script>
    alert ("Email enviado");
    window.location="./index.html";
    </script>
 '
 ;
}else 
echo
"Error";

?>