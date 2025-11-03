<?php
    include_once __DIR__."../models/connectaDB.php";
    include_once __DIR__."../models/m_missatges.php";

    $conn = connectaBD();
    $missatge = consultaMissatge($conn, $_GET["IDmissatge"]);

    include_once __DIR__."../vista/v_missatges.php";

?>