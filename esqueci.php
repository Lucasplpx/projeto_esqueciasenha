<?php 
require 'connection.php';

if(!empty($_POST['email']) && isset($_POST['email'])){

    $email = addslashes($_POST['email']);


    $sql = "SELECT * FROM usuarios WHERE email = :email";
    $sql = $pdo->prepare($sql);
    $sql->bindValue(":email", $email);
    $sql->execute();

    if($sql->rowCount() > 0){
        $dado = $sql->fetch();

        $id = $dado['id'];

        $token = md5(time().rand(0, 99999).rand(0, 99999));

        $sql = "INSERT INTO usuarios_token (id_usuario, hash, expired_in) 
        VALUES (:id_usuario, :hash, :expired_in)";

        $sql = $pdo->prepare($sql);
        $sql->bindValue(":id_usuario", $id);
        $sql->bindValue(":hash", $token);
        $sql->bindValue(":expired_in", date('Y-m-d H:i', strtotime('+2 months')));
    
        $sql->execute();


        $link = "<a href='http://localhost/projeto_esqueciasenha/redefinir.php?token=".$token."' target='_blank' >Clique aqui para redefinir senha!</a>";
        $mensagem =  "Acesse seu e-mail e clique no link para redefinir sua senha: <br/>".$link;

        $assunto = "Redefinição de senha";

        $headers = "From: lucas.passos@hmja.com.br". "\r\n".
                    "X-mailer: PHP/".phpversion();
        
        //mail($email, $assunto, $mensagem, $headers);

        echo $mensagem;
        exit;


    }

}


?>

<form method="post">

    Qual o seu E-mail? <br/>
    <input type="email" name="email"/> <br/> <br/>

    <input type="submit" value="Enviar"/>

</form>