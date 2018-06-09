<!DOCTYPE html>
<html>
<head>
	<title>Admin Panel</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="<?php echo base_url('css/adminstyle.css'); ?>">
  	<!-- <script type="text/javascript">
  		$(document).ready(function(){
  			$("button").click(function(){
  				$(".add").show();
  			})
  		});
  	</script>
 --></head>
<body>
<div class="header">
<h1>ADMIN PANEL</h1>
<p>Welcome <i><?php echo $this->session->userdata('username'); ?></i> </p>
<p style="text-align: right; margin: -20px 10px 0px 0px;"><a href="<?php echo site_url('admin/logout') ?>" >Logout</a></p>
</div>
<div class="container" style="padding-top: 20px;">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		<li class="dropdown-m"><a data-toggle="tab" href="#articles">Articles</a></li>
		<li><a data-toggle="tab" href="#pictures">Pictures</a></li>
		<li><a data-toggle="tab" href="#comments">Comments</a></li>
		<li><a data-toggle="tab" href="#polls">Polls</a></li>
	</ul>
	<br>
	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<div class="container">
				<p>Username: <?php echo $this->session->userdata('username'); ?></p>
				<p>Email: <?php echo $this->session->userdata('email'); ?></p>
				<p>Role: <?php echo $this->session->userdata('role'); ?></p>
				<p><i><?php echo $this->session->flashdata('msg_success'); ?></i></p>
			</div>
		</div>
		<div id="articles" class="tab-pane fade" >
			<p><button onclick="content('add')">Add </button>/<button onclick="content('ed')">Edit </button>/<button onclick="content('ed')">Delete</button> articles.</p>
			<div id="add">
				<p>Add new articles.</p>
				<form action="<?php echo site_url('Admin/add') ?>" method="post" autocomplete="off">
					<div class="table-responsive">
					<table class="table">
					<tr>
						<td><label>Title</label></td>
						<td><input type="text" name="title" required></td>
					</tr><tr>
						<td><label>Category</label></td>
						<td><input type="text" name="category" required></td>
					</tr><tr>
						<td><label>Slug</label></td>
						<td><input type="text" name="slug" required></td></tr>
						<tr>
						<td><label>Image link</label></td>
						<td><input type="text" name="image" required></td></tr>
						<tr>
						<td><label>Info</label></td>
						<td><input type="text" name="info" required></td></tr>
						<tr>
						<td><label>Date <i>(yyyy-mm-dd)</i></label></td>
						<td><input type="text" name="date" required></td></tr>
						<tr>
						<td><label>Author</label></td>
						<td><input type="text" name="author" required></td></tr>
						<tr>
						<td><label>Body</label></td>
						<td><textarea name="body" required col="40" row="4" style="height: 400px; width: 100%;"></textarea></td></tr>
					</table>
				</div>
				<div style="text-align: center; padding: 10px 20px;">
				<button style="text-transform: uppercase;" type="submit"><h5>Submit<h5></button>
				</div>
				</form>
			</div>
			<div id="ed">
				<h3>Edit/Delete</h3><hr>
				<?php foreach ($posts as $post) : ?>
					<div class="row">
					<div class="col-md-7">
					<p><?php echo $post['title']; ?></p>
					</div>
					<div class="col-md-5">
					<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-6">
					<p style="text-align: left;"><small><?php echo $post['author'].' | '.$post['date'] ?></small></p>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
					<p style="text-align: right;"><a href="">EDIT</a> <a href="<?php echo site_url('Admin/delete/'.$id=$post['id']); ?>">DELETE</a></p>
					</div>
					</div>
					</div>
					</div>
					<hr>
				<?php endforeach; ?>
			</div>
		</div>
			
		<div id="pictures" class="tab-pane fade" >
			<p>Pictures</p>
		</div>
		<div id="comments" class="tab-pane fade" >
			<p>Comments</p>
		</div>
		<div id="polls" class="tab-pane fade" >
			<p>Polls</p>
		</div>
	</div>
</div>
<br>

<script type="text/javascript">
	function content(x) {
		var show = document.getElementById(x);
		document.getElementById('add').style.display = 'none';
		document.getElementById('ed').style.display = 'none';
		show.style.display = 'block';

	}

</script>
</body>
</html>