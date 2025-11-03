<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Desenvolupament Web</title>
        <link rel="stylesheet" type="text/css" href="./css/forum.css">
    </head>
    <body>
        <header>
            <img src="./img/css.png" id="css"/>
            <img src="./img/html.png" id="html"/>
            <img src="./img/js.png" id="js"/>
            <h1 class="titolGran">Fòrum de <em>Desenvolupament Web</em></h1>
        </header><br/>
        <div id="layout">
            <section>
			<h2 class="titolPetit"><?php echo date("d/m/y")." ".date("h.i") ?> - <em><?php echo $_POST["nom"] ?></em> va escriure:</h2><hr/>
                <div class="missatge"><?php 
                    echo $_POST["resposta"];
                ?>
                </div><hr>
            <h2 class="titolPetit">GRÀCIES PER LA TEVA RESPOSTA!</h2>
		</section>
        </div>
        
    </body>
</html>