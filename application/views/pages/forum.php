

<h1 style="text-align: center;">DISCUSSION FORUM </h1>
<hr style="width: 80%">
<?php if (!$this->session->userdata('logged_in') == TRUE) { ?>
<div class="container">
<p><button onclick="document.getElementById('login').style.display='block'" style="background: white; border: none; color: #FF00FF;"><b>LogIn</b></button>to start a thread.</p>
</div>

<?php }
else { ?>
<div class="container">
  <p><button onclick="forumpost()" style="border: none;">Add</button> a new thread.</p>
</div>
<?php } ?>

<div class="container">
<?php   
foreach ($posts as $post) : ?>
<div class="forumposts">
<div class="col-md-8 col-sm-8">
  <a href="<?php echo site_url('forum/'.$post['post_id']); ?>">
    <h4><?php echo $post['title']; ?></h4>
  </a>
</div>
<div class="col-md-4 col-sm-4">
  <?php echo $post['created_by']; ?>
</div>
</div>
<?php endforeach; ?>
</div>

<div id="newpost">
  <div class="container">
    <form action="<?php echo site_url('Admin/addforumpost') ?>" method="post" autocomplete="off">
          <div class="table-responsive">
          <table class="table">
          <tr>
            <td><label>Title</label></td>
            <td><input type="text" name="title" required></td>
          </tr><tr>
            <td><label>Date<i>(yyyy-mm-dd)</i></label></td>
            <td><input type="text" name="date" required></td></tr>
            <tr>
            <td><label>Content</label></td>
            <td><textarea name="content" required col="40" row="4" style="height: 200px; width: 100%;"></textarea></td></tr>
          </table>
        </div>
        <div style="text-align: center; padding: 10px 20px;">
        <button style="text-transform: uppercase; border: none;" type="submit"><h5>Submit<h5></button>
        </div>
        </form>
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

<script type="text/javascript">

  function forumpost() {
    var posts = document.getElementsByClassName('forumposts');
    for (i = 0; i < posts.length; i++) {
      posts[i].style.display = "none";
    }
    document.getElementById('newpost').style.display = 'block';
  }

</script>

</body>
</html>
