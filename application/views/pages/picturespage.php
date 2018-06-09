
<header>
  The Week in Pictures
</header>
<hr style="width: 90%;"><br>

<div class="container">
<?php foreach ($pictures as $picture) : ?>
<div class="row">
<div class="piccap col-md-3">
  <h2><?php echo $picture['title']; ?></h2>
  <p><?php echo $picture['info']; ?></p>
</div>

<div class="col-md-9" id="<?php echo 'pic'.$picture['id']; ?>">
  <img src="<?php echo base_url().'images/'.$picture['image']; ?>" width="100%">
</div>
</div>
<br>
<?php endforeach; ?>
</div>

<br>
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
