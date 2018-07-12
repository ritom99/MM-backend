<hr style="width: 40%;">
<div class="row">
    <div class="col-md-3 col-sm-3" style="text-align: center;"><br>
      <strong>Editor's Picks</strong><hr>
        <div class="editorspicks">
          <?php foreach ($editors_picks as $post) : ?>
            <a href="<?php echo site_url('articles/'.$slug=$post['slug']) ?>"><img src="<?php echo base_url().'images/'.$post['image'] ?>" width="100%" >
            <h2><?php echo $post['title']; ?></h2></a>
            <p class="author"><?php echo $post['author']; ?></p>

            <br><br>
          <?php endforeach; ?>
        </div>
    </div>

    <div class="col-md-6 col-sm-6" style="text-align: center;"><br>
    <?php foreach ($featured_posts as $post) : ?>
      <br>
      <a href="<?php echo site_url('articles/'.$slug=$post['slug']) ?>">
      <img src="<?php echo base_url().'images/'.$post['image'] ?>" width="80%">
      <h2><?php echo $post['title']; ?></h2></a>
      <p class="info"><?php echo $post['info']; ?></p>
      <p class="author"><?php echo $post['author']; ?></p>
    <?php endforeach; ?>
  
    </div>

    <div class="col-md-3 col-sm-3" style="text-align: center;"><br>
      <strong>Latest posts</strong><hr>
      
      <div class="latest">
        <?php foreach ($latest_posts as $post) : ?>
	      <a href="<?php echo site_url('articles/').$post['slug']; ?>">
	      <img src="<?php echo base_url().'images/'.$post['image']; ?>" width="100%">
	      <h2><?php echo $post['title'] ?></h2>
	      </a>
	      <p class="author"><?php echo $post['author'] ?></p>

	      <br><br>
      <?php endforeach; ?>
	    </div>
  </div>
	</div>

<div class="row">
<hr width="95%"><br>
<div class="slideshow col-md-6">
<?php foreach ($pictures as $picture) : ?>
  <div class="slides">
    <div class="number">1 / 6</div><a href="<?php echo site_url('pictures').'#pic'.$picture['id']; ?>">
    <img src="<?php echo base_url().'images/'.$picture['image']; ?>" height=300px width="100%">
		<p class="caption"><?php echo $picture['title']; ?></p></a>
  </div>
<?php endforeach; ?>

<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>
</div>

<div class="poll col-md-6">
  <div class="row">
    <div class="col-md-4" style="padding-top: 35px;">
      <div id="maxp">
      <p><h2>POLL</h2></p>
      <p><h2>OF</h2></p>
      <p><h2>THE</h2></p>
      <p><h2>WEEK</h2></p>
      </div>
      <div id="minp" style="text-align: center;">
        <p><h2>POLL OF THE WEEK</h2></p>
      </div>
    </div>
    <div class="col-md-8">
      
    </div>
  </div>
</div>
</div>

<div style="text-align: center;">
  <p><i><a href="<?php echo site_url('askaquestion'); ?>" style="text-decoration: none !important; text-transform: none !important;">Got a query? Ask any question anonymously.</a></i></p>
</div>

<footer><hr>
<div style="text-align: center;">
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

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("slides");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  slides[slideIndex-1].style.display = "block";
}
</script>

</body>
</html>
