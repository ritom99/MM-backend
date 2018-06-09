<!DOCTYPE html>
<html>
<head>
	<title><?php if($pagetitle) { echo $pagetitle; }
    else { echo $post['title']; } ?></title>
	<link rel="shortcut icon" href="<?php echo base_url(); ?>images/favicon.ico" />
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/style.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
<div style="margin-top: -25px;"><br>
<h1 style="font-family: Simplifica">T S M</h1>
<nav class="navbar navbar-default" role="navigation" style="background-color: white;">
  <div class="navbar-header">
  	<div class="logo">
  		<img src="<?php echo base_url(); ?>images/favicon.ico" width="110%">
  	</div>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  </div>
  <div class="navbar-collapse collapse">
    <ul class="nav navbar-nav navbar-center">
          <li><a href="<?php echo site_url('homepage')?>">Home</a></li>
          <li><a href="<?php echo site_url('businessandtech')?>">Business and Tech</a></li>
          <li><a href="<?php echo site_url('sports')?>">Sports</a></li>
          <li><a href="<?php echo site_url('pictures')?>">Pictures</a></li>
          <li><a href="<?php echo site_url('forum')?>">Forum</a></li>
      </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><form action="/action_page.php" autocomplete="off">
          <input type="text" placeholder="Search articles..." name="search">
          <button type="submit"><i class="fa fa-search"></i></button>
        </form>
      </li>
    </ul>
  </div>
</nav>
</div>

<?php if (!$this->session->userdata('logged_in')) { ?>

<div class="forms">
	<button onclick="document.getElementById('signup').style.display='block'" style="width: auto;"><b>Sign Up</b></button>
	<button onclick="document.getElementById('login').style.display='block'" style="width: auto;"><b>Login</b></button>
</div>

<div id="signup" class="modal">
	<span onclick="document.getElementById('signup').style.display='none'" class="close">&times;</span>
	<form class="modal-content animate" action="<?php echo site_url('Users/signup'); ?>" method="post" autocomplete="off">
    <div class="container">
      <h1>Sign Up</h1>
      <p><i>Create an account.</i></p>
      <hr>
      <label for="username"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="username" required><br>

      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required><br>

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue; text-decoration:none; text-transform: none; ">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="button" onclick="document.getElementById('signup').style.display='none'" class="cancelbtn"><b>Cancel</b></button>
        <button type="submit" class="signupbtn"><b>Sign Up</b></button>
      </div>
    </div>
  </form>
</div>

<div id="login" class="modal">
	<span onclick="document.getElementById('login').style.display='none'" class="close">&times;</span>
  <form class="modal-content animate" action="<?php echo site_url('Users/login'); ?>" method="post" autocomplete="off">
    	<div class="container">
			<h1>Login</h1>
			<hr>
      <label for="username"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="username" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
			
			<br>
      <button type="submit" class="loginbtn"><b>Login</b></button>

      <button type="button" onclick="document.getElementById('login').style.display='none'" class="cancelbtn"><b>Cancel</b></button>
    	</div>
  </form>
</div>
<p style="text-align: center;"><?php echo $this->session->flashdata('msg_error'); ?></p>
<p style="text-align: center;"><?php echo $this->session->flashdata('signup_msg'); ?></p>

<?php }
else {
  echo '<p style="text-align: center;">'.$this->session->flashdata('msg_success').'</p>';
  echo '<p style="text-align: center;">Welcome <i><strong>'.$this->session->userdata('username');
  if ($this->session->userdata('role') == 'admin') {
    echo " (admin)";
  }
  echo '</strong></i></p>'; ?>
  <p style="text-align: center;">
    <a href=" <?php echo site_url('Users/logout'); ?>" style="text-transform: none;">Logout</a>
  </p> 
<?php }
?>