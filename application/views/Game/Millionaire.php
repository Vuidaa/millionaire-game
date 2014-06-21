<body>
 <div id='wrapper'>

 	<div id='millionaire-summary'>

 		<h1>Congratulations! You've Won a <?php echo $Prize;?> Dollars!</h1>
 		
 		<h2> Please enter your name below, and we will put you on records list </h2>

 		<?php 
 			echo form_open('game/millionaire',array('id'=>'millionaireForm'));
 			echo form_input(array('name'=>'username','placeholder'=>'Enter your name !'));
 			echo form_submit(array('name'=>'submit','value'=>'Submit', 'class'=>'button info-btn'));
 			echo '<p>'.validation_errors().'</p>';
 			echo form_close();
 		?>
 		
 		<a href='/' class='button info-btn'> Main menu </a>

 	</div>
</div> 
</body>
</html>