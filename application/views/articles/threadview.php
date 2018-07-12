<br>
<div class="container">
	<div class="header">
		<?php echo $post['title']; ?>
	</div>
	<br>
	<p><?php echo $post['post'] ?></p>
	<hr>
	<div class="comments">
		<?php foreach ($comments as $comment) : ?>
			<p><strong><?php echo $comment['user']; ?></strong></p>
			<p><small><?php echo $comment['date']; ?></small></p>
			<p><?php echo $comment['body']; ?></p>
			<hr>
		<?php endforeach; ?>
	</div>
</div>

<div class="container">
	<?php if (!$this->session->userdata('logged_in') == TRUE) { ?>
		<p><button onclick="document.getElementById('login').style.display='block'" style="background: white; border: none; color: #FF00FF;"><b>LogIn</b></button>to reply.</p>
	<?php }
	else { ?>
		<p><strong>Reply</strong></p>
		<form action="<?php echo site_url('Admin/addforumcomment/'.$post['post_id']); ?>" method="post" autocomplete="off">
			<textarea name="comment" col="40" row="4" style="width: 100%; height: 150px;"></textarea>
			<div style="text-align: center; padding: 10px 20px;">
        	<button style="text-transform: uppercase; border: none;" type="submit"><h5>Submit<h5></button>
        	</div>
		</form>
	<?php } ?>
</div>

<footer><hr>
<div class="container" style="text-align: center;">
      <p>Follow us on:</p>
      <a href="#" class="fa fa-facebook"></a>
      <a href="#" class="fa fa-twitter"></a>
      <br><br>
</div>
</footer>

</body>
</html>