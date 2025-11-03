<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8"/>
    <title>Desenvolupament Web</title>
    <link rel="stylesheet" type="text/css" href="./css/forum.css">
    <script src="./js/funcions.js"></script>
    </head>
    <body>
        <header>
            <img src="./img/css.png" id="css"/>
            <img src="./img/html.png" id="html"/>
            <img src="./img/js.png" id="js"/>
            <h1 class="titolGran">Fòrum de <em>Desenvolupament Web</em></h1>
        </header><br/>
        <div id="layout">
            <?php include_once __DIR__ . "/controladors/c_missatgesLlistat.php"; ?>
            <section>
                <h2 class="titolPetit">Escriu la teva resposta:</h2> <hr/>
                    <form method="post" action="./resposta.php">
                        <input type="text" id="inputNom" name="nom" size="15" required /><br/>
                        <textarea id="inputResposta" name="resposta" rows="10" cols="200" required></textarea><br/>
                    <input type="submit" id="inputEnviar" value="ENVIAR" />
                </form>
            </section>
        </div>
    </body>
</html>