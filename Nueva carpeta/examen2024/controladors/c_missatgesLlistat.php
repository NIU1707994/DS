<?php
	include_once __DIR__."../models/connectaBD.php";
	include_once __DIR__."../models/m_missatges.php";

	$conn = connectaBD();
	$missatges = consultaMissatges($conn);

	include_once __DIR__."../vista/v_missatgesLlistat.php";
?>