
<br>
<div class="container">
	<div class="row">
  	<div class="info col-md-4">
	<h1><?php echo $post['title']; ?></h1>
	<br>
  	<p><?php echo $post['info']; ?></p>
  	<div class="author">
   	<p><?php echo $post['author'].' | '.$post['date'] ?></p> 
  	</div>
  	<br>
  	</div>
  	<div class="col-md-8">
	 <img src="<?php echo base_url().'images/'.$post['image'] ?>" width="100%"><br>
	</div>
  	</div>
  	<hr>
	<br>
	<div class="article">
    <?php echo $post['body']; ?>
	</div>
  <br>
  <h4><strong>Comments</strong></h4>
  <hr>
</div>

<div class="container">
  <div class="comments">
    <?php foreach ($comments as $comment) : ?>
        <p><strong><?php echo $comment['user'].' | '.$comment['date']; ?></strong></p>
        <p><?php echo $comment['content']; ?></p>
        <hr>
      <?php endforeach; ?>
    <?php if (!$this->session->userdata('logged_in') == TRUE) { ?>
      <p><button onclick="document.getElementById('login').style.display = 'block'" style="background: white; border: none; color: #FF00FF; margin-left: -7px;">Login</button>to comment.</p><br>
    <?php } else { ?>
      <p><i>Add a comment.</i></p>
      <form action="<?php echo site_url('Admin/addcomment/').$post['id']; ?>" method="post" autocomplete="off">
        <textarea name="comment" col="40" row="4" style="width: 100%; height: 100px;" required></textarea>      
        <button style="text-transform: uppercase; border: none;" type="submit"><h5>Submit</h5></button>
      </form>
      <?php } ?>
  </div>
</div>


<footer><hr>
    <div style="text-align: center;">
      <p>Follow us on:</p>
      <a href="#" class="fa fa-facebook"></a>
      <a href="#" class="fa fa-twitter"></a>
      <br><br>
    </div>
</footer>

</body>
</html>
