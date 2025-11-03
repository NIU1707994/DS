<?php
	foreach($missatges as $missatge)
	{
	?>
		<section>
			<h2 class="titolPetit"><?php echo $missatge["data"] ?> - <em><?php echo $missatge["nom"] ?></em> va escriure:</h2><hr/>
				<div id="<?php echo $missatge['IDmissatge'] ?>">
					<?php 
					echo substr($missatge["text"], 0, 100);
					if (strlen($missatge["text"]) > 100) { ?>
						<button type="button" onClick="ampliaMissatge(<?php echo $missatge['IDmissatge'] ?>);">Veure més</button>
					<?php }
					?>
			</div>
		</section>
		<?php
	}
?>