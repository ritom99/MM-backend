<h1 style="text-align: center;">ASK A QUESTION</h1>
<hr style="width: 80%"><br>

<div class="container">
	<i><?php echo $this->session->flashdata('question_success'); ?></i>
	<form method="post" action="<?php echo site_url('Admin/askaq'); ?>" autocomplete="off">
		<input type="text" name="question" placeholder="Write a question" required style="width: 70%; padding: 5px;"> &nbsp; &nbsp;
		<button style="border: none; padding: 7px 10px;">SUBMIT</button>
	</form>
</div>
<br>

<div class="container">
	<p><strong><button onclick="questions()" style="border: none; background-color: white; color: #FF00FF; margin-left: -8px;">View</button></strong>previous questions.</p>
	<div id="questions" style="display: none;">
		<hr>
		<?php foreach ($questions as $question) : ?>
			<p><h4>Q : <?php echo $question['question']; ?></h4></p>
			<p>A : <?php echo $question['answer']; ?></p>
			<hr>
		<?php endforeach; ?>
	</div>
</div>

<script type="text/javascript">
	function questions() {
		var x = document.getElementById("questions");
    	if (x.style.display == "none") {
        	x.style.display = "block";
    	} else {
        	x.style.display = "none";
    	}
	}
</script>

</body>
</html>