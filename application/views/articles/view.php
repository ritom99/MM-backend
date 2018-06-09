
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
