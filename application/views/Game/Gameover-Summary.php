<body>
 <div id='wrapper'>

 	<div id='gameover-summary'>

 		<h1> Game over </h1>
 		<?php echo $Prize; ?>

 		<a href='/game' class='button info-btn'> Play again </a>
 		<a href='/' class='button info-btn'> Main menu </a>

 	</div>
</div> 
</body>
</html>
<?php $this->session->sess_destroy();?>