<?php
require 'connection.php';


if(isset($_GET['token']) && !empty($_GET['token'])){
    $token = $_GET['token'];

    $sql = "SELECT * FROM usuarios_token WHERE hash = :hash AND used = 0 AND expired_in > NOW()";

    $sql = $pdo->prepare($sql);
    $sql->bindValue(":hash", $token);
    $sql->execute();

    if($sql->rowCount() > 0){

        if(!empty($_POST['senha'])){
            $dado = $sql->fetch();

            $id = $dado['id_usuario'];
            $senha = $_POST['senha'];

            $sql = "UPDATE usuarios SET senha = :senha WHERE id = :id";
            $sql = $pdo->prepare($sql);
            $sql->bindValue(":senha", md5($senha));
            $sql->bindValue(":id", $id);
            $sql->execute();

            $sql = "UPDATE usuarios_token SET used = 1 WHERE hash = :hash";
            $sql = $pdo->prepare($sql);
            $sql->bindValue(":hash", $token);
            $sql->execute();

            echo 'Senha alterada com sucesso!';
            exit;

        }


        ?>
        <form method="POST">
            Digite a nova senha: <br/>
            <input type="password" name="senha"/><br/>
            <input type="submit" value="Mudar Senha"/>
        </form>
        <?php
    }else {
        echo 'Token invalido ou usado!';
        exit;
    }

}



?>