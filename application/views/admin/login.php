<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('css/adminstyle.css'); ?>">
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="text-align: center;">
	<div class="login">
	<form action="<?php echo site_url('Admin/login'); ?>" method="post" autocomplete="off">
		<h3><strong>Login</strong></h3>
		<input type="text" name="username" placeholder="Username"><br>
		<input type="password" name="password" placeholder="Password">
		<?php echo '<p>'.($this->session->flashdata('error_msg')).'</p>' ?>
		<div class="clearfix"><button type="submit"><strong>Login</strong></button></div>
	</form>
	</div>
</div>
</body>
</html>