<?php
    function consultaMissatges($conn) {
        $sql = "SELECT IDmissatge, data, nom, text FROM missatges";
        $consulta = pg_query($conn, $sql) or die("Error sql");
        $missatges = pg_fetch_all($consulta);

        return($missatges);
    }

    function consultaMissatge($conn, $idMissatge) {
        $sql = "SELECT IDmissatge, data, nom, text FROM missatges WHERE IDmissatge=$idMissatge";
        $consulta = pg_query($conn, $sql) or die("Error sql");
        $missatge = pg_fetch_all($consulta)[0];

        return($missatge);
    }
?>