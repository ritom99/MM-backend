
<header>
  Sports
</header>
<hr style="width: 90%;"><br>
<div class="container">
<div class="row">
	<div class="col-md-8">
		<a href="<?php echo site_url('articles/'.$most_recent['slug']) ?>">
      	<img src="<?php echo base_url().'images/'.$most_recent['image'] ?>" width="100%" height="560px">
      	</a>
      	<br>
	</div>
	<div class="info col-md-4">
		<a href="<?php echo site_url('articles/'.$most_recent['slug']) ?>"><h2><?php echo $most_recent['title']; ?></p></h2></a>
        <p class="info"><?php echo $most_recent['info']; ?></p>
      	<p class="author"><?php echo $most_recent['author']; ?></p>
      	<br>
	</div>
</div>

<hr>
<h4 style="text-align: center; font-style: italic;">Latest Posts</h4>
<br>
<div class="articles">
<?php foreach ($latest_posts as $post) : ?>
<div class="row">
<div class="col-md-4 col-sm-4">
  <a href="<?php echo site_url('articles/'.$post['slug']) ?>">
    <img src="<?php echo base_url().'images/'.$post['image']; ?>" width="100%" height = "230px">
</a>
</div>
<div class="col-md-8 col-sm-8">
    <a href="<?php echo site_url('articles/'.$post['slug']) ?>"><h2><?php echo $post['title']; ?></h2></a>
    <p class="author"><?php echo $post['author']; ?></p>
</div>
</div>
<br>
<?php endforeach; ?>

</div>
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
