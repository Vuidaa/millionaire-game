<body>
 <div id='wrapper'>
 	<!--===================Start of Header, main area for timer and helpers==================-->
	<div id='header'>
		 <h3>Question for - <span class='sum'><?php echo $this->session->userdata('Question')['step'];?></span> dollars. </h3>
		<p> Gurantee Money - <?php echo $this->session->userdata('GuaranteePrize'); ?> </p>
		<p> Your money - <?php echo $this->session->userdata('FinishGamePrize');?> </p>
		<h2 class='sum' id='countdown'> 0:15 </h2>
			<?php 
				$Helpers = $this->session->userdata('Helpers');

				foreach($Helpers as $Help)
				{
			?>
		<button class='button helper-button' id="<?php echo $Help;?>" value="<?php echo $Help;?>"><?php echo $Help;?> </button>
			<?php
				}
			?>
	</div>
	<!--===================End of Header==================-->

	<!--===================Start of Content-area, main area for question==================-->
	<center id='question' onmousedown='return false;' onselectstart='return false;'>
		<h2><?php echo $this->session->userdata('Question')['question']; ?> </h2>
	</center>
	<!--===================End of Content-area==================-->
	<div id='info'>
		<p></p>
		<!--==========Info box, for various AJAX calls=============-->
	</div>
</div>
<!--==========Start of Footer, which contains four answers=============-->
<div id='footer'>

	<?php $Answers = array(
		'A'=>$this->session->userdata('Question')['A'],
		'B'=>$this->session->userdata('Question')['B'],
		'C'=>$this->session->userdata('Question')['C'],
		'D'=>$this->session->userdata('Question')['D']);

		foreach ($Answers as $key => $answer) 
		{
	?>
		<button class='button answer-button'  value="<?php echo $key; ?>"> <span value='<?php echo $key;?>'class='answer-letter'><?php echo $key.' - ';?> </span><?php echo $answer ?></button>
	<?php
		}
	
	?>
</div>
<!--==========End of footer=============-->

		<script src="<?php echo base_url();?>js/jquery.js" type='text/javascript' charset="UTF-8"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    	<script src="<?php echo base_url();?>js/javascript.js" type='text/javascript' charset="UTF-8"></script> 
	</body>
</html>