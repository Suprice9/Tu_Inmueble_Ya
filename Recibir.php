<?php
use PHPMailer\PHPMailer\PHPMailer;

use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

    if (isset($_POST['enviar'])){

        $nombre = $_POST['enviar'];
        $email = $_POST['email'];
        $asunto = $_POST['asunto'];
        $mensaje = $_POST['mensaje'];

    

    //recipiente
    $mailTo='wilmirafael123@gmail.com';

    //email
    $subject ='Un nuevo mensje recibido por'.$nombre;

    //mensaje del cuerpo
    $htmlContent = '<h2> Email requerido recibido<h2>
    <p> <b>Nombre del cliente: </b>'.$nombre.'</p>
    <p> <b>Asunto: </b>'.$asunto.'</p>
    <p> <b>Mensaje: </b>'.$mensaje.'</p>

    ';

    //Cabezera
//$headers = "From:".$nombre."<".$email.">";
//$headers = "MIME-Version:1.\r\n";
//$headers = "Content-Type:text/html;charset=UFT-8\r\n";


$headers =  'MIME-Version: 1.0' . "\r\n"; 
$headers .= 'From:'.$nombre. '<'.$email.'>' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 

//Funcion php
$mail=new PHPMailer(true);

$mail->isSMTP();
$mail->Host='smtp.gmail.com';
$mail->SMTPAuth= true;
$mail->Username='wilmirafael123@gmail.com';
$mail->Password ='xvaqebikqhcbsfkx';
$mail->SMTPSecure = 'ssl';
$mail->Port =465;

$mail->setFrom('wilmirafael123@gmail.com');

$mail->addAddress($email);

$mail->isHTML(true);

$mail->Subject=$asunto;
    
$mail->Body=$mensaje;

$mail ->send ();

$result = mail($mailTo,$subject,$htmlContent,$headers);
var_dump($result);


//Error

    if ($result){
$success = "El mensaje se envio exitosamente";
    }else{
$failed = "Erro:Mensaje no fue enviado, pruede mas tarde";

    }

    }

?>