

<h1 style="text-align: center;">DISCUSSION FORUM </h1>
<hr style="width: 80%">
<?php if (!$this->session->userdata('logged_in') == TRUE) { ?>
<div class="container">
<p><button onclick="document.getElementById('login').style.display='block'" style="background: white; border: none; color: #FF00FF;"><b>LogIn</b></button>to start a thread</p>
</div>

<div class="modal" id="login">
  <span onclick="document.getElementById('login').style.display='none'" class="close">&times;</span>
  <form class="modal-content animate" action="<?php echo site_url('Users/login'); ?>" method="post">
    <div class="container">
      <h1>Login</h1>
      <hr>
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="username" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
			<label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
			<span class="psw">Forgot <a href="#" style="text-decoration:none; text-transform: none; color:dodgerblue">password?</a></span>
			<br>
      <button type="submit" class="loginbtn"><b>Login</b></button>

      <button type="button" onclick="document.getElementById('login').style.display='none'" class="cancelbtn"><b>Cancel</b></button>
    </div>
  </form>
</div>
<?php } ?>

<footer><hr>
<div class="container" style="text-align: center;">
      <p>Follow us on:</p>
      <a href="#" class="fa fa-facebook"></a>
      <a href="#" class="fa fa-twitter"></a>
      <br><br>
</div>
</footer>

<script type="text/javascript">
// var modal = document.getElementById('signup');

// window.onclick = function(event) {
//     if (event.target == modal) {
//         modal.style.display = "none";
//     }
// }

</script>

</body>
</html>
